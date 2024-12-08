import 'package:flutter/widgets.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/styles/shadow.dart';

class ItemSystemSupport extends StatelessWidget {
  const ItemSystemSupport(
      {super.key,
      this.imgUrl =
          "https://mashmoshem.co.id/wp-content/uploads/2024/08/MMI-Banner-2.webp",
      this.title = "title",
      this.desc = "description",
      this.onTap});

  // final Size? sizeScreen;
  final String? title;
  final String? imgUrl;
  final String? desc;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260.0,
        height: 184.0,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: ColorApps.white,
          boxShadow: boxShadow,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgUrl!,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    style: black500,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    desc!,
                    overflow: TextOverflow.ellipsis,
                    style: black400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}