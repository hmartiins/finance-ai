import 'package:finance_ai/adapters/auth/storage_adapter.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class FirebaseAuthAdapter implements IAuthAdapter {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthAdapter({
    required this.firebaseAuth,
  });

  final _log = Logger('FirebaseAuthAdapter');

  @override
  Future<Result<String>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      _log.info('Executing login with email and password');

      if (email.isEmpty || password.isEmpty) {
        return Result.error(Exception('E-mail and password must be filled'));
      }

      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _log.info(
          'User logged in with email and password. User ${userCredential.user}');

      return const Result.ok('User logged in with email and password');
    } catch (e) {
      _log.severe('Error logging in with email and password: $e');
      return Result.error(
          Exception('Error logging in with email and password.'));
    }
  }

  @override
  Future<Result<String>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      _log.info('Executing register with email and password');

      if (email.isEmpty || password.isEmpty) {
        return Result.error(Exception('E-mail and password must be filled'));
      }

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _log.info(
          'User registered with email and password. User ${userCredential.user}');

      return const Result.ok('User registered with email and password');
    } catch (e) {
      return Result.error(Exception('Erro ao registrar usuário: $e'));
    }
  }

  @override
  Future<void> logout() async {
    try {
      _log.info('Executing logout');

      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Erro ao realizar logout: $e');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    _log.info('Checking if user is authenticated');

    final currentUser = firebaseAuth.currentUser;
    final isAuthenticated = currentUser != null;

    _log.info('User is authenticated: $isAuthenticated');

    return isAuthenticated;
  }

  @override
  Future<String?> getUserId() async {
    _log.info('Getting user id');

    final currentUser = firebaseAuth.currentUser;

    return currentUser?.uid;
  }
}
