import 'package:fantastico_app/utils/assets_helper.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.toolbarHeight = kToolbarHeight,
    this.title,
    this.hasBackButton = false,
    this.onPressedBack,
    this.trailingButton,
    super.key,
  });

  final Widget? title;
  final bool hasBackButton;
  final void Function()? onPressedBack;
  final Widget? trailingButton;
  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      leading: hasBackButton
          ? GestureDetector(
              onTap: onPressedBack ?? () => Navigator.of(context).pop(),
              child: SizedBox(
                width: 30,
                height: preferredSize.height,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            )
          : null,
      actions: trailingButton != null
          ? [
              const SizedBox(
                width: 8,
              ),
              trailingButton!,
            ]
          : null,
      centerTitle: true,
      title: title ??
          Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetHelper.logoFantastico,
                    width: 120,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    AssetHelper.logoComicCastle,
                    width: 120,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
