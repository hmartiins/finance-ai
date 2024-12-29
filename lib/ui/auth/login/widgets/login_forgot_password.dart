import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Forgot Password?',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.violet100,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
