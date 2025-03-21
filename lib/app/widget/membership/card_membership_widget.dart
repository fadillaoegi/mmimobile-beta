import 'package:flutter/widgets.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class CardMembership extends StatelessWidget {
  const CardMembership({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [
            ColorApps.platinumMember2,
            ColorApps.platinumMember,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Membership",
              style: white700.copyWith(fontSize: 14.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "min - max",
              style: white700.copyWith(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
