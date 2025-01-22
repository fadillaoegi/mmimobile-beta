import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class TwoItemProfileSetting extends StatelessWidget {
  const TwoItemProfileSetting({
    super.key,
    this.value = "",
    this.valueTwo = "",
    this.title = "",
    this.titleTwo = "",
    this.onTap,
    this.onTapTwo,
    this.activeSectionTwo = true,
  });

  final String? title;
  final String? value;
  final VoidCallback? onTap;
  final String? titleTwo;
  final String? valueTwo;
  final VoidCallback? onTapTwo;
  final bool? activeSectionTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApps.white,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? "",
                    style: black400.copyWith(fontSize: 13.0),
                  ),
                  Row(
                    children: [
                      Text(
                        value ?? "",
                        style: black400.copyWith(fontSize: 13.0),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: ColorApps.disable2,
            thickness: 0.1,
          ),
          activeSectionTwo!
              ? GestureDetector(
                  onTap: onTapTwo,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          titleTwo ?? "",
                          style: black400.copyWith(fontSize: 13.0),
                        ),
                        Row(
                          children: [
                            Text(
                              valueTwo ?? "",
                              style: black400.copyWith(fontSize: 13.0),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
