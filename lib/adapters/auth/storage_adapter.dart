import 'package:finance_ai/utils/result.dart';

abstract class IAuthAdapter {
  Future<Result<String>> loginWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<String>> registerWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> logout();
  Future<bool> isAuthenticated();
  Future<String?> getUserId();
}
