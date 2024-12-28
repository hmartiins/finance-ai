import 'package:finance_ai/adapters/auth/storage_adapter.dart';
import 'package:finance_ai/utils/command.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({
    required IAuthAdapter authAdapter,
  }) : _authAdapter = authAdapter {
    login = Command1<void, (String email, String password)>(_login);
  }

  final IAuthAdapter _authAdapter;
  final _log = Logger('SignUpViewModel');

  bool _termsAndConditionsAccepted = false;
  bool? get termsAndConditionsAccepted => _termsAndConditionsAccepted;

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

  set termsAndConditionsAccepted(bool? value) {
    _termsAndConditionsAccepted = value ?? _termsAndConditionsAccepted;
    notifyListeners();
  }
}
