abstract class AuthenticationRepository {
  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordException] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
