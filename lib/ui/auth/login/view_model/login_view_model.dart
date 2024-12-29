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
  }

  final IAuthAdapter _authAdapter;
  final _log = Logger('LoginViewModel');

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool get loginButtonIsDisabled =>
      login.running || email.text.isEmpty || password.text.isEmpty;

  late Command0 login;

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

  set emailValue(String value) {
    email.text = value;
    notifyListeners();
  }

  set passwordValue(String value) {
    password.text = value;
    notifyListeners();
  }
}
