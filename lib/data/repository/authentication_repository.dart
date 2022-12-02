abstract class AuthenticationRepository {
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
