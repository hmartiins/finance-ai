import 'package:finance_ai/adapters/auth/storage_adapter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class FirebaseAuthAdapter implements IAuthAdapter {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthAdapter({
    required this.firebaseAuth,
  });

  final _log = Logger('FirebaseAuthAdapter');

  @override
  Future<String> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      _log.info('Executing login with email and password');

      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user?.uid ?? '';
    } catch (e) {
      throw Exception('Erro ao realizar login: $e');
    }
  }

  @override
  Future<String> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      _log.info('Executing register with email and password');

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user?.uid ?? '';
    } catch (e) {
      throw Exception('Erro ao registrar usuário: $e');
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

    return currentUser != null;
  }

  @override
  Future<String?> getUserId() async {
    _log.info('Getting user id');

    final currentUser = firebaseAuth.currentUser;

    return currentUser?.uid;
  }
}
