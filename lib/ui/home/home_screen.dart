import 'package:fantastico_app/repositories/home_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/app/widgets/custom_app_bar.dart';
import 'package:fantastico_app/ui/app/widgets/product_list_horizontal.dart';
import 'package:fantastico_app/ui/home/cubit/home_cubit.dart';
import 'package:fantastico_app/ui/home/home_brand_list.dart';
import 'package:fantastico_app/utils/assets_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        homeRepository: ServiceLocator.getIt<HomeRepository>(),
      )..onInitial(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            toolbarHeight: 100,
          ),
          body: SafeArea(
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        AssetHelper.avengersCover,
                        height: 200,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const HomeBrandList(),
                  const SizedBox(
                    height: 16,
                  ),
                  if (state.weeks != null)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.weeks?.length,
                        itemBuilder: (context, index) {
                          if (state.weeks != null) {
                            final week = state.weeks![index];
                            return ProductListHorizontal(
                              title: week.weekDescription,
                              products: week.weekProducts != null
                                  ? week.weekProducts!
                                      .map(
                                        (e) => ProductCompact(
                                          id: e.productId,
                                          imageURL: e.productImage,
                                        ),
                                      )
                                      .toList()
                                  : List.empty(),
                              viewMoreOnPressed: () {
                                context.go(
                                  '/home/week?name=${week.weekDescription}&number=${week.weekNumber}',
                                );
                              },
                              parentRoute: '/home',
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
