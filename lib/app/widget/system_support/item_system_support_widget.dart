import 'package:flutter/widgets.dart';
import 'package:mmimobile/app//styles/color.dart';
import 'package:mmimobile/app//styles/fonts.dart';
import 'package:mmimobile/app//styles/shadow.dart';

class ItemSystemSupport extends StatelessWidget {
  const ItemSystemSupport(
      {super.key,
      this.imgUrl =
          "https://mashmoshem.co.id/wp-content/uploads/2024/08/MMI-Banner-2.webp",
      this.title = "title",
      this.desc = "description",
      this.height = 184.0,
      this.width = 260.0,
      this.onTap});

  // final Size? sizeScreen;
  final String? title;
  final String? imgUrl;
  final String? desc;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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
