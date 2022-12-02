import 'package:px_test_task/config/consts.dart';
import 'package:px_test_task/data/errors/exceptions.dart';
import 'package:px_test_task/data/repository/authentication_repository.dart';

class FakeAuthenticationRepository implements AuthenticationRepository {
  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordException] if an exception occurs.
  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500))
        .then((value) => null);
    if (email != FakeSignIn.email || password != FakeSignIn.password) {
      throw const LogInWithEmailAndPasswordException(
        message: 'Wront email or password',
      );
    }
  }
}
