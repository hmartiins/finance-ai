import 'package:finance_ai/routing/routes.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              onPressed: () {
                context.push(Routes.signUp);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.violet20,
                ),
              ),
              onPressed: () {
                context.push(Routes.login);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.violet100,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
