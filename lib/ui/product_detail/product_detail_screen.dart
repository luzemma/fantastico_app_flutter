import 'package:fantastico_app/repositories/product_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/app/widgets/button_add_cart.dart';
import 'package:fantastico_app/ui/app/widgets/custom_app_bar.dart';
import 'package:fantastico_app/ui/app/widgets/product_list_horizontal.dart';
import 'package:fantastico_app/ui/product_detail/cubit/product_detail_cubit.dart';
import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailProvider extends StatelessWidget {
  const ProductDetailProvider({
    this.hashedId,
    super.key,
  });

  final String? hashedId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
        productRepo: ServiceLocator.getIt<ProductRepository>(),
        hashedId: hashedId,
      )..onInitial(),
      child: const ProductDetailScreen(),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final routes = GoRouter.of(context)
        .routerDelegate
        .currentConfiguration
        .matches
        .map((e) => e.matchedLocation)
        .toList();
    final previous =
        routes.length - 2 >= 0 ? routes[routes.length - 2] : '/home';
    return Scaffold(
      appBar: const CustomAppBar(
        toolbarHeight: 100,
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state.product == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final product = state.product!;
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Image.network(
                                  product.imageFileName!,
                                  width: 120,
                                  height: 220,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox.shrink(),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (product.name != null) ...[
                                        Text(
                                          product.name!,
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                      if (product.brand != null) ...[
                                        Text(
                                          product.brand!,
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: ColorHelper.lightGray,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                      if (product.line != null) ...[
                                        Text(
                                          product.line!,
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: ColorHelper.lightGray,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                      if (product.price != null) ...[
                                        Wrap(
                                          children: [
                                            Text(
                                              'Precio:',
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: ColorHelper.lightGray,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              r'$' '${product.offerPrice}',
                                              style: textTheme.titleMedium
                                                  ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ]
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonAddCart(
                            alignment: Alignment.center,
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if (product.availabilityDetail != null) ...[
                            Text(
                              'Disponible en:',
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              product.availabilityDetail!
                                  .map((e) => e.shop)
                                  .join(','),
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                          if (product.synopsis != null) ...[
                            Text(
                              'Descripción',
                              style:
                                  textTheme.bodyLarge?.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              product.synopsis!,
                              style:
                                  textTheme.bodySmall?.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ]
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (product.relatedComics != null)
                      ProductListHorizontal(
                        title: 'Relacionados',
                        products: product.relatedComics!
                            .map(
                              (e) => ProductCompact(
                                id: e.id,
                                imageURL: e.imageFileName ?? '',
                              ),
                            )
                            .toList(),
                        parentRoute: previous,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
