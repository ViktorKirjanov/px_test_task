import 'package:px_test_task/config/consts.dart';

import '../errors/exceptions.dart';
import 'authentication_repository.dart';

class FakeAuthenticationRepository implements AuthenticationRepository {
  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordException] if an exception occurs.
  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (email != FakeSignIn.email || password != FakeSignIn.password) {
      throw const LogInWithEmailAndPasswordException(
        message: 'Wront email or password',
      );
    }
  }
}
