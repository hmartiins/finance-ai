import 'dart:io';

import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ImageAttachment extends StatelessWidget {
  const ImageAttachment({
    super.key,
    required this.image,
    required this.onTap,
  });

  final File image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 124,
      height: 124,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 115,
              height: 115,
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              onTap: onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.dark75.withAlpha((0.4 * 255).toInt()),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
