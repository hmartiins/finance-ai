import 'package:finance_ai/adapters/auth/storage_adapter.dart';
import 'package:finance_ai/ui/auth/login/view_model/login_view_model.dart';
import 'package:finance_ai/ui/auth/login/widgets/login_screen.dart';
import 'package:finance_ai/ui/home/view_models/home_viewmodel.dart';
import 'package:finance_ai/ui/home/widgets/home_screen.dart';
import 'package:finance_ai/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:finance_ai/ui/new_expense/widgets/new_expense_screen.dart';
import 'package:finance_ai/ui/onboarding/view_models/onboarding_viewmodel.dart';
import 'package:finance_ai/ui/onboarding/widgets/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          path: Routes.login,
          builder: (context, state) {
            final viewModel = LoginViewModel(
              authAdapter: context.read(),
            );

            return LoginScreen(
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
            final viewModel = NewExpenseViewModel(
              generativeAIService: context.read(),
              expenseCreateUseCase: context.read(),
            );

            return NewExpenseScreen(
              viewModel: viewModel,
            );
          },
        ),
      ],
    );

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final bool loggedIn = await context.read<IAuthAdapter>().isAuthenticated();
  final bool loggingIn = state.matchedLocation == Routes.login ||
      state.matchedLocation == Routes.onboarding;

  if (!loggedIn) {
    return Routes.onboarding;
  }

  // if the user is logged in but still on the login page or onboarding page,
  // send them to the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}
