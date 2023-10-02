import 'package:flutter/material.dart';

class HomeWeekComicList extends StatelessWidget {
  const HomeWeekComicList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text('Semana 1'),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 200,
                    child: Image.network(
                      'https://im.fantasticocomic.com/im/b/5d/0e00422bb9453398496a77bd6cabe.jpg',
                      width: 120,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 200,
                    child: Image.network(
                      'https://im.fantasticocomic.com/im/d/bb/30d48f18ef385109d74c456bf73c5.jpg',
                      width: 120,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 200,
                    child: Image.network(
                      'https://im.fantasticocomic.com/im/9/b2/bac0bf74ff852c4bbfb9d3ed8427c.jpg',
                      width: 120,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 200,
                    child: Image.network(
                      'https://im.fantasticocomic.com/im/0/01/fab52e306cd9599bb46abb8fc7060.jpg',
                      width: 120,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
