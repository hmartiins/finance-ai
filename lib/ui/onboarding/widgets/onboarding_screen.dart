import 'package:finance_ai/ui/core/ui/page_container.dart';
import 'package:finance_ai/ui/onboarding/view_models/onboarding_viewmodel.dart';
import 'package:finance_ai/ui/onboarding/widgets/onboarding_assets.dart';
import 'package:finance_ai/ui/onboarding/widgets/onboarding_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.viewModel,
  });

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Column(
        children: [
          Expanded(child: Container()),
          const OnboardingAssets(),
          Expanded(child: Container()),
          const OnboardingButtons(),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
