import 'package:finance_ai/routing/routes.dart';
import 'package:finance_ai/ui/auth/login/view_model/login_view_model.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:finance_ai/ui/core/ui/page_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onResult);
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onResult);
    super.dispose();
  }

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
              controller: _email,
              decoration: const InputDecoration(
                hintText: "Email",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _password,
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
                onPressed: () async {
                  widget.viewModel.login.execute((
                    _email.text,
                    _password.text,
                  ));
                },
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

  void _onResult() {
    if (widget.viewModel.login.completed) {
      widget.viewModel.login.clearResult();
      context.go(Routes.home);
    }

    if (widget.viewModel.login.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Verify your credentials and try again.'),
        ),
      );
      widget.viewModel.login.clearResult();
    }
  }
}
