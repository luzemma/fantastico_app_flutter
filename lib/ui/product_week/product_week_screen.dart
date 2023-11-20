import 'package:fantastico_app/repositories/product_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/app/widgets/custom_app_bar.dart';
import 'package:fantastico_app/ui/product_item/product_list_item.dart';
import 'package:fantastico_app/ui/product_week/cubit/product_week_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductWeekProvider extends StatelessWidget {
  const ProductWeekProvider({
    required this.weekNumber,
    required this.description,
    super.key,
  });

  final int weekNumber;
  final String description;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductWeekCubit(
        productRepo: ServiceLocator.getIt<ProductRepository>(),
        weekNumber: weekNumber,
        title: description,
      )..onInitial(),
      child: const ProductWeekScreen(),
    );
  }
}

class ProductWeekScreen extends StatelessWidget {
  const ProductWeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductWeekCubit, ProductWeekState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            toolbarHeight: 100,
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
                            '/home/week/product/${state.data!.products[index].hashedId}',
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
