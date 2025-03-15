import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle(
      {super.key, this.size = 60.0, this.edit = true, this.image, this.onTap});

  final double size;
  final bool edit;
  final ImageProvider<Object>? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          clipBehavior: Clip.none, // Agar icon edit tidak terpotongI
          children: [
            ClipOval(
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: image,
              ),
            ),
            edit
                ? Positioned(
                    bottom: -3, // Posisikan sedikit keluar dari lingkaran
                    right: -3,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(174, 255, 255, 255),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(56, 0, 0, 0),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.edit,
                            size: 14, color: ColorApps.secondary),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
