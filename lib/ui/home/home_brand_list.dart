import 'package:fantastico_app/models/brand.dart';
import 'package:flutter/material.dart';

class HomeBrandList extends StatelessWidget {
  const HomeBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    brands.shuffle();
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            height: 80,
            child: Image.asset(
              brands[index].imageFile,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
