import 'package:fantastico_app/models/models.dart';
import 'package:fantastico_app/ui/app/widgets/button_add_cart.dart';
import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    required this.product,
    this.onTap,
    super.key,
  });

  final Product product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    if (product.imageFileName != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        height: 150,
                        child: Image.network(
                          product.imageFileName!,
                          width: 80,
                          height: 150,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox.shrink(),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.name != null) ...[
                            Text(
                              product.name!,
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                          if (product.brand != null) ...[
                            Text(
                              product.brand!,
                              style: textTheme.bodyMedium?.copyWith(
                                color: ColorHelper.lightGray,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                          if (product.line != null) ...[
                            Text(
                              product.line!,
                              style: textTheme.bodyMedium?.copyWith(
                                color: ColorHelper.lightGray,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ]
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 8),
                      child: Text(
                        r'$' '${product.offerPrice}',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                ButtonAddCart(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 15,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
