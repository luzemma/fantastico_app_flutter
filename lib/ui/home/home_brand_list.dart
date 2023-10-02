import 'package:fantastico_app/models/brand.dart';
import 'package:flutter/material.dart';

class HomeBrandList extends StatelessWidget {
  const HomeBrandList({super.key});

  static const double _width = 80;
  static const double _height = 80;

  @override
  Widget build(BuildContext context) {
    brands.shuffle();
    return SizedBox(
      height: _height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            height: _height,
            child: Image.asset(
              brands[index].imageFile,
              width: _width,
              height: _height,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
