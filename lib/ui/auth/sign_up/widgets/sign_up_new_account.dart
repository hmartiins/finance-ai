import 'package:finance_ai/routing/routes.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpNewAccount extends StatelessWidget {
  const SignUpNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Routes.login);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.dark25,
                ),
            children: [
              TextSpan(
                text: 'Login',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.violet100,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
