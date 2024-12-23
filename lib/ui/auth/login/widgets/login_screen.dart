import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:finance_ai/ui/core/ui/page_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return PageContainer(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            TextField(
              decoration: const InputDecoration(
                hintText: "Email",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: const InputDecoration(
                hintText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              ),
              obscureText: true,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 38),
            SizedBox(
              width: size.width,
              child: FilledButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            InkWell(
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
            ),
            const SizedBox(height: 28),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have an account yet? ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.dark25,
                        ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.violet100,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
