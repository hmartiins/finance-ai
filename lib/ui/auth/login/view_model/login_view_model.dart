import 'package:finance_ai/adapters/auth/auth_adapter.dart';
import 'package:finance_ai/utils/command.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:logging/logging.dart';

class LoginViewModel {
  LoginViewModel({
    required IAuthAdapter authAdapter,
  }) : _authAdapter = authAdapter {
    login = Command1<void, (String email, String password)>(_login);
  }

  final IAuthAdapter _authAdapter;
  final _log = Logger('LoginViewModel');

  late Command1 login;

  Future<Result<String>> _login((String, String) credentials) async {
    _log.info('Logging in with email and password');

    final (email, password) = credentials;

    final result = await _authAdapter.loginWithEmailAndPassword(
      email,
      password,
    );

    if (result is Error<String>) {
      _log.warning('Login failed! ${result.error}');
    }

    return result;
  }
}
