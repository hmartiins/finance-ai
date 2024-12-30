import 'package:finance_ai/ui/auth/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        TextField(
          controller: viewModel.email,
          onChanged: (value) {
            viewModel.emailValue = value;
          },
          decoration: const InputDecoration(
            hintText: "Email",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        TextField(
          controller: viewModel.password,
          onChanged: (value) {
            viewModel.passwordValue = value;
          },
          decoration: const InputDecoration(
            hintText: "Password",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
          obscureText: true,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 38),
        SizedBox(
          width: size.width,
          child: FilledButton(
            onPressed: viewModel.loginButtonIsDisabled
                ? null
                : () async {
                    viewModel.login.execute();
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
      ],
    );
  }
}
