import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';

class SpinnerLoader extends StatelessWidget {
  const SpinnerLoader({
    required this.width,
    required this.height,
    this.color,
    super.key,
  });

  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: color ?? ColorHelper.primaryBlue,
      ),
    );
  }
}
