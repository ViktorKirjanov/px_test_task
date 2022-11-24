import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc_observer.dart';
import 'config/custom_theme.dart';
import 'data/repository/authentication_repository.dart';
import 'data/repository/fake_authentication_repository.dart';
import 'data/repository/fake_product_repository.dart';
import 'data/repository/product_repository.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  runApp(App(
    authenticationRepository: FakeAuthenticationRepository(),
    productRepository: FakeProductRepository(),
  ));
}

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final ProductRepository _productRepository;

  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
    required ProductRepository productRepository,
  })  : _authenticationRepository = authenticationRepository,
        _productRepository = productRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider<ProductRepository>.value(
          value: _productRepository,
        ),
      ],
      child: MaterialApp(
        title: 'PX',
        themeMode: ThemeMode.dark,
        theme: CustomTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
