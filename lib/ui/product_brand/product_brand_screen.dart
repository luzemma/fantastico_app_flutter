import 'package:fantastico_app/repositories/product_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/product_brand/cubit/product_brand_cubit.dart';
import 'package:fantastico_app/ui/product_item/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductBrandProvider extends StatelessWidget {
  const ProductBrandProvider({
    required this.brandId,
    required this.description,
    super.key,
  });

  final int brandId;
  final String description;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBrandCubit(
        productRepo: ServiceLocator.getIt<ProductRepository>(),
        brandId: brandId,
        title: description,
      )..onInitial(),
      child: const ProductBrandScreen(),
    );
  }
}

class ProductBrandScreen extends StatelessWidget {
  const ProductBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBrandCubit, ProductBrandState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: state.data != null
                ? ListView.builder(
                    itemCount: state.data!.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 8,
                        ),
                        child: ProductListItem(
                          product: state.data!.products[index],
                          onTap: () => context.go(
                            '/home/brand/product/${state.data!.products[index].hashedId}',
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
