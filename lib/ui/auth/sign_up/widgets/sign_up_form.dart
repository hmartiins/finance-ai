import 'package:finance_ai/ui/auth/sign_up/view_model/sign_up_view_model.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    required this.viewModel,
    super.key,
  });

  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        TextField(
          controller: viewModel.name,
          decoration: const InputDecoration(
            hintText: "Name",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        TextField(
          controller: viewModel.email,
          decoration: const InputDecoration(
            hintText: "Email",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        TextField(
          controller: viewModel.password,
          decoration: const InputDecoration(
            hintText: "Password",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
          obscureText: true,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: viewModel.termsAndConditionsAccepted,
              onChanged: (bool? value) {
                viewModel.termsAndConditionsAccepted = value;
              },
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'By signing up, you agree to the ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Terms of Service and Privacy Policy',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.violet100,
                          ),
                    ),
                  ],
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const SizedBox(height: 38),
        SizedBox(
          width: size.width,
          child: FilledButton(
            onPressed: viewModel.signUpButtonIsDisabled
                ? null
                : () async {
                    await viewModel.register.execute();
                  },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Sign Up",
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
