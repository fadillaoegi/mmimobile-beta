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
          _buildItem(title, value, onTap),
          if (activeSectionTwo!)
            Divider(color: ColorApps.disable2, thickness: 0.1),
          if (activeSectionTwo!) _buildItem(titleTwo, valueTwo, onTapTwo),
        ],
      ),
    );
  }

  Widget _buildItem(String? title, String? value, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: black400.copyWith(fontSize: 13.0),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    _truncateText(value ?? "", 10), // Batasi 10 karakter
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: black400.copyWith(fontSize: 13.0),
                  ),
                ),
                const SizedBox(width: 10.0),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // NOTE Fungsi untuk membatasi teks maksimal 10 karakter
  String _truncateText(String text, int maxLength) {
    return (text.length > maxLength)
        ? '${text.substring(0, maxLength)}...'
        : text;
  }
}
