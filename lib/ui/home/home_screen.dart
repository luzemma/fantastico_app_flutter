import 'package:fantastico_app/ui/home/home_brand_list.dart';
import 'package:fantastico_app/ui/home/home_week_comic_list.dart';
import 'package:fantastico_app/utils/assets_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  AssetHelper.avengersCover,
                  height: 200,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  HomeBrandList(),
                  SizedBox(
                    height: 16,
                  ),
                  HomeWeekComicList(),
                  HomeWeekComicList(),
                  HomeWeekComicList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
