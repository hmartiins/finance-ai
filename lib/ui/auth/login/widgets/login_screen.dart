import 'package:finance_ai/routing/routes.dart';
import 'package:finance_ai/ui/auth/login/view_model/login_view_model.dart';
import 'package:finance_ai/ui/auth/login/widgets/login_forgot_password.dart';
import 'package:finance_ai/ui/auth/login/widgets/login_form.dart';
import 'package:finance_ai/ui/auth/login/widgets/login_new_account.dart';
import 'package:finance_ai/ui/auth/widgets/google_button.dart';
import 'package:finance_ai/ui/core/ui/page_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult);
    widget.viewModel.loginWithGoogle.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onResult);
    oldWidget.viewModel.loginWithGoogle.removeListener(_onResult);
    widget.viewModel.login.addListener(_onResult);
    widget.viewModel.loginWithGoogle.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onResult);
    widget.viewModel.loginWithGoogle.removeListener(_onResult);
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
        child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, _) {
              return Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  LoginForm(viewModel: widget.viewModel),
                  const SizedBox(height: 28),
                  GoogleButton(
                    isLogin: true,
                    onPressed: widget.viewModel.loginWithGoogle.execute,
                  ),
                  const SizedBox(height: 28),
                  const LoginForgotPassword(),
                  const SizedBox(height: 28),
                  const LoginNewAccount(),
                ],
              );
            }),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.login.completed) {
      widget.viewModel.login.clearResult();
      context.go(Routes.home);
    }

    if (widget.viewModel.loginWithGoogle.completed) {
      widget.viewModel.loginWithGoogle.clearResult();
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

    if (widget.viewModel.loginWithGoogle.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login with Google failed. Try again later.'),
        ),
      );
      widget.viewModel.loginWithGoogle.clearResult();
    }
  }
}
