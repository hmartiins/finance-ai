import 'package:finance_ai/adapters/auth/auth_adapter.dart';
import 'package:finance_ai/utils/command.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    required IAuthAdapter authAdapter,
  }) : _authAdapter = authAdapter {
    login = Command0<void>(_login);
    loginWithGoogle = Command0<void>(_loginWithGoogle);
  }

  final IAuthAdapter _authAdapter;
  final _log = Logger('LoginViewModel');

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool get loginButtonIsDisabled =>
      login.running || email.text.isEmpty || password.text.isEmpty;

  late Command0 login;
  late Command0 loginWithGoogle;

  Future<Result<String>> _login() async {
    notifyListeners();

    try {
      _log.info('Logging in with email and password');

      final result = await _authAdapter.loginWithEmailAndPassword(
        email.text,
        password.text,
      );

      if (result is Error<String>) {
        _log.warning('Login failed! ${result.error}');
      }

      return result;
    } catch (e) {
      return Result.error(Exception('An error occurred'));
    } finally {
      notifyListeners();
    }
  }

  Future<Result<String>> _loginWithGoogle() async {
    try {
      _log.info('Logging user with google');

      final result = await _authAdapter.loginWithGoogle();

      if (result is Error<String>) {
        _log.warning('Login with google failed! ${result.error}');
      }

      return result;
    } catch (e) {
      _log.warning('Login with google failed! $e');
      return Result.error(Exception('An error occurred'));
    } finally {
      notifyListeners();
    }
  }

  set emailValue(String value) {
    email.text = value;
    notifyListeners();
  }

  set passwordValue(String value) {
    password.text = value;
    notifyListeners();
  }
}
