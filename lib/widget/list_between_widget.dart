import 'package:flutter/widgets.dart';
import 'package:mmimobile/styles/fonts.dart';

class ListBetween extends StatelessWidget {
  const ListBetween({
    super.key,
    this.field = "",
    this.value = "",
  });
  final String? field;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$field",
          style: black400.copyWith(fontSize: 16.0),
        ),
        Text(
          "$value",
          style: primary400.copyWith(fontSize: 16.0),
        ),
      ],
    );
  }
}
