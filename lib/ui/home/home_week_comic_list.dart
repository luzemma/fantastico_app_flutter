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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  week.weekDescription,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Ver más',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.blue.shade600,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
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
