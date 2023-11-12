import 'package:fantastico_app/repositories/product_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.product?.name ?? ''),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Container(
                    height: 400,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
