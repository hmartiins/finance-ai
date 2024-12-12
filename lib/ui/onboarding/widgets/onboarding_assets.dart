import 'package:finance_ai/config/assets.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class OnboardingAssets extends StatelessWidget {
  const OnboardingAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(
            image: AssetImage(Assets.controlOfMoney),
          ),
        ),
        Text(
          "Gain total control \nof your money",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          "Become your own money manager\nand make every cent count",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.dark25,
              ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
