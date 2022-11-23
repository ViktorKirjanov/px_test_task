import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc_observer.dart';
import 'config/custom_theme.dart';
import 'data/repository/authentication_repository.dart';
import 'data/repository/fake_authentication_repository.dart';
import 'screens/signin_screen/signin_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  runApp(App(authenticationRepository: FakeAuthenticationRepository()));
}

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;

  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MaterialApp(
        title: 'PX',
        themeMode: ThemeMode.dark,
        theme: CustomTheme.darkTheme,
        home: const SignInScreen(),
      ),
    );
  }
}
