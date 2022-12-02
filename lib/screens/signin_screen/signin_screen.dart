import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px_test_task/blocs/signin_cubit/signin_cubit.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/data/repository/authentication_repository.dart';
import 'package:px_test_task/screens/signin_screen/_widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: CustomTheme.contentPadding,
            child: BlocProvider(
              create: (_) => SignInCubit(
                context.read<AuthenticationRepository>(),
              ),
              child: const SignInForm(),
            ),
          ),
        ),
      );
}
