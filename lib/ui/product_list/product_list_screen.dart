import 'package:fantastico_app/ui/product/product_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: const [
            ProductItem(),
          ],
        ),
      ),
    );
  }
}
