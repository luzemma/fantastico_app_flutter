import 'package:fantastico_app/models/week_by_home.dart';
import 'package:flutter/material.dart';

class HomeWeekComicList extends StatelessWidget {
  const HomeWeekComicList({
    required this.week,
    super.key,
  });

  final WeekByHome week;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(week.weekDescription),
          ),
          const SizedBox(
            height: 8,
          ),
          if (week.weekProducts != null)
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: week.weekProducts!.length,
                itemBuilder: (context, index) {
                  final product = week.weekProducts![index];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 200,
                    child: Image.network(
                      product.productImage,
                      width: 120,
                      height: 200,
                      fit: BoxFit.contain,
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
