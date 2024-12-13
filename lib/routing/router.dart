import 'package:finance_ai/ui/home/view_models/home_viewmodel.dart';
import 'package:finance_ai/ui/home/widgets/home_screen.dart';
import 'package:finance_ai/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:finance_ai/ui/new_expense/widgets/new_expense_screen.dart';
import 'package:finance_ai/ui/onboarding/view_models/onboarding_viewmodel.dart';
import 'package:finance_ai/ui/onboarding/widgets/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

/// Top go_router entry point.
///
/// Listens to changes in [AuthTokenRepository] to redirect the user
/// to /login when the user logs out.
GoRouter router() => GoRouter(
      initialLocation: Routes.onboarding,
      debugLogDiagnostics: true,
      redirect: _redirect,
      routes: [
        GoRoute(
          path: Routes.onboarding,
          builder: (context, state) {
            final viewModel = OnboardingViewModel();

            return OnboardingScreen(
              viewModel: viewModel,
            );
          },
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            final viewModel = HomeViewModel();

            return HomeScreen(
              viewModel: viewModel,
            );
          },
        ),
        GoRoute(
          path: Routes.newExpanse,
          builder: (context, state) {
            final viewModel = NewExpenseViewModel();

            return NewExpenseScreen();
          },
        ),
      ],
    );

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // no need to redirect at all
  return null;
}
