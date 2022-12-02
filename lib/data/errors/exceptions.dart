class LogInWithEmailAndPasswordException implements Exception {
  const LogInWithEmailAndPasswordException({
    this.message = 'An unknown exception occurred.',
  });

  final String message;
}

class ServerException implements Exception {}
