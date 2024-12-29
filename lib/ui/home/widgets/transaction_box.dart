import 'package:finance_ai/config/assets.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

enum TransactionType { income, expense }

class TransactionBox extends StatelessWidget {
  final TransactionType type;
  final double amount;

  const TransactionBox({
    super.key,
    required this.type,
    required this.amount,
  });

  String get _formattedAmount {
    return amount.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isIncome = type == TransactionType.income;
    final color = isIncome ? AppColors.green100 : AppColors.red100;

    return SizedBox(
      width: size.width * 0.45,
      height: 80.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.light80,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  isIncome ? Assets.moneyIn : Assets.moneyOut,
                  color: color,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isIncome ? "Income" : "Expenses",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.light80,
                        ),
                  ),
                  Text(
                    "\$$_formattedAmount",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.light80,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
