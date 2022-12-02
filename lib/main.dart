import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px_test_task/blocs/bloc_observer.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/data/repository/authentication_repository.dart';
import 'package:px_test_task/data/repository/fake_authentication_repository.dart';
import 'package:px_test_task/data/repository/fake_product_repository.dart';
import 'package:px_test_task/data/repository/product_repository.dart';
import 'package:px_test_task/screens/signin_screen/signin_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: CustomTheme.black3,
      statusBarColor: CustomTheme.black3,
    ),
  );

  runApp(
    App(
      authenticationRepository: FakeAuthenticationRepository(),
      productRepository: FakeProductRepository(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
    required ProductRepository productRepository,
  })  : _authenticationRepository = authenticationRepository,
        _productRepository = productRepository;

  final AuthenticationRepository _authenticationRepository;
  final ProductRepository _productRepository;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
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
          home: const SignInScreen(),
        ),
      );
}
