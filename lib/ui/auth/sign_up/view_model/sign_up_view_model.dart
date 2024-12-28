import 'package:finance_ai/adapters/auth/storage_adapter.dart';
import 'package:finance_ai/utils/command.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({
    required IAuthAdapter authAdapter,
  }) : _authAdapter = authAdapter {
    register = Command0(_register);
  }

  final IAuthAdapter _authAdapter;
  final _log = Logger('SignUpViewModel');

  bool _termsAndConditionsAccepted = false;
  bool? get termsAndConditionsAccepted => _termsAndConditionsAccepted;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  late Command0 register;

  bool get signUpButtonIsDisabled =>
      register.running ||
      termsAndConditionsAccepted == false ||
      name.text.isEmpty ||
      email.text.isEmpty ||
      password.text.isEmpty;

  Future<Result<String>> _register() async {
    notifyListeners();

    try {
      _log.info('Registering user with email and password');

      final result = await _authAdapter.registerWithEmailAndPassword(
        email.text,
        password.text,
      );

      if (result is Error<String>) {
        _log.warning('Register failed! ${result.error}');
      }

      return result;
    } catch (e) {
      _log.warning('Register failed! $e');
      return Result.error(Exception('An error occurred'));
    } finally {
      notifyListeners();
    }
  }

  set termsAndConditionsAccepted(bool? value) {
    _termsAndConditionsAccepted = value ?? _termsAndConditionsAccepted;
    notifyListeners();
  }
}
