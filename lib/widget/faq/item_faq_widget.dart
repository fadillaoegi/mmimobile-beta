import 'package:flutter/widgets.dart';
import 'package:mmimobile/styles/fonts.dart';

class ItemFaq extends StatelessWidget {
  const ItemFaq({
    super.key,
    this.desc = "",
    this.title = "",
  });
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title == "" ? "Quetion ?" : title.toString(),
          style: black600.copyWith(fontSize: 16.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          desc == ""
              ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only"
              : desc.toString(),
          style: black400.copyWith(fontSize: 13.0),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
