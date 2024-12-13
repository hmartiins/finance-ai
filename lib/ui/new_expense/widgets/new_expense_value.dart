import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class NewExpenseValue extends StatelessWidget {
  const NewExpenseValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "How much?",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.light20,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            r"$80",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
