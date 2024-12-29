import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final double size;
  final String imageUrl;

  const ProfileIcon({super.key, required this.size, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
          color: AppColors.violet100,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: Image.network(
            imageUrl,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
