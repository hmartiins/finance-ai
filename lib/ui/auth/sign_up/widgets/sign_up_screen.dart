import 'package:finance_ai/routing/routes.dart';
import 'package:finance_ai/ui/auth/sign_up/view_model/sign_up_view_model.dart';
import 'package:finance_ai/ui/auth/sign_up/widgets/sign_up_form.dart';
import 'package:finance_ai/ui/auth/sign_up/widgets/sign_up_new_account.dart';
import 'package:finance_ai/ui/auth/sign_up/widgets/sing_up_google_button.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:finance_ai/ui/core/ui/page_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  final SignUpViewModel viewModel;

  const SignUpScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant SignUpScreen oldWidget) {
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
          'Sign Up',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, snapshot) {
              return Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  SignUpForm(
                    viewModel: widget.viewModel,
                  ),
                  const SizedBox(height: 12),
                  const SignUpGoogleButton(),
                  const SizedBox(height: 14),
                  const SignUpNewAccount(),
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
