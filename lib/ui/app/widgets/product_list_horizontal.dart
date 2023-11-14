import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCompact {
  ProductCompact({
    required this.id,
    required this.imageURL,
  });

  final String id;
  final String imageURL;

  String get hashedId => base64.encode(id.codeUnits);
}

class ProductListHorizontal extends StatelessWidget {
  const ProductListHorizontal({
    required this.title,
    required this.products,
    required this.parentRoute,
    this.viewMoreOnPressed,
    super.key,
  });

  final String title;
  final List<ProductCompact> products;
  final String parentRoute;
  final void Function()? viewMoreOnPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (viewMoreOnPressed != null)
                  GestureDetector(
                    onTap: viewMoreOnPressed,
                    child: Text(
                      'Ver más',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.blue.shade600,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    if (parentRoute == '/home') {
                      context.go(
                        '$parentRoute/product/${product.hashedId}',
                      );
                    } else {
                      context.pushReplacement(
                        '$parentRoute/product/${product.hashedId}',
                      );
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 200,
                    child: Image.network(
                      product.imageURL,
                      width: 120,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
