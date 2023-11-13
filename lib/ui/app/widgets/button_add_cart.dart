import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';

class ButtonAddCart extends StatelessWidget {
  const ButtonAddCart({
    this.alignment,
    this.onPressed,
    super.key,
  });
  final AlignmentGeometry? alignment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorHelper.primaryBlue),
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        label: Text(
          'Agregar al carrito',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
