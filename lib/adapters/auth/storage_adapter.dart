abstract class IAuthAdapter {
  Future<String> loginWithEmailAndPassword(String email, String password);
  Future<String> registerWithEmailAndPassword(String email, String password);
  Future<void> logout();
  Future<bool> isAuthenticated();
  Future<String?> getUserId();
}
