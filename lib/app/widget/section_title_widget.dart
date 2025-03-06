import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    super.key,
    this.title,
    this.onTap,
    this.size = 14.0,
    this.seeMoreActive = false,
  });

  final String? title;
  final VoidCallback? onTap;
  final double size;
  final bool seeMoreActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Agar teks bisa turun ke bawah
      children: [
        // **Gunakan Expanded agar teks bisa wrap otomatis**
        Expanded(
          child: Text(
            title?.isNotEmpty == true ? title! : "Question?",
            style: black700.copyWith(fontSize: size),
            softWrap: true, // **Pastikan teks wrap ke bawah**
            overflow: TextOverflow.visible, // **Agar tidak terpotong**
          ),
        ),
        if (seeMoreActive) // **Hanya tampilkan tombol jika aktif**
          TextButton(
            onPressed: onTap,
            child: Text(
              "See Others",
              style: secondary400.copyWith(fontSize: size - 2),
            ),
          ),
      ],
    );
  }
}
