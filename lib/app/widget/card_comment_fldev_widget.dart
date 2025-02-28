import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class CardCommentFLdev extends StatelessWidget {
  const CardCommentFLdev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16.0,
              backgroundImage: AssetImage(AssetConfigFLdev.logo),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alifah',
                    style: black600.copyWith(fontSize: 12.0),
                  ),
                  RatingBarIndicator(
                    rating: (1 + 1).toDouble(),
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 20.0,
                  ),
                  Text(
                    '10-Februari-2025',
                    style: black400.copyWith(fontSize: 10.0),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    'Lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum',
                    style: black500.copyWith(fontSize: 12.0),
                    softWrap: true, // Pastikan teks wrap
                    overflow:
                        TextOverflow.visible, // Pastikan overflow ditangani
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 8),
        const Divider()
      ],
    );
  }
}
