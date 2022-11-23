class LogInWithEmailAndPasswordException implements Exception {
  final String message;

  const LogInWithEmailAndPasswordException({
    this.message = 'An unknown exception occurred.',
  });
}
