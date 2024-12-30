import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:finance_ai/ui/home/widgets/transaction_box.dart';
import 'package:flutter/material.dart';

class HomeBalance extends StatelessWidget {
  const HomeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Account balance",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.light20),
        ),
        const SizedBox(height: 8),
        Text(
          "\$1900",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 40, color: AppColors.dark75),
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TransactionBox(type: TransactionType.income, amount: 500),
            TransactionBox(type: TransactionType.expense, amount: 1000),
          ],
        )
      ],
    );
  }
}
