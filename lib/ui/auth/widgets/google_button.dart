import 'package:finance_ai/config/assets.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    this.isLogin = false,
    required this.onPressed,
  });

  final Future<void> Function() onPressed;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Text(
          'Or with',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.dark25,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: size.width,
          child: OutlinedButton(
            onPressed: () async {
              await onPressed();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(Assets.googleIcon),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isLogin ? 'Login with Google' : 'Sign Up with Google',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.dark50,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
