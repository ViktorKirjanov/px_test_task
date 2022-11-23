import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/signin_cubit/signin_cubit.dart';
import '../../config/custom_theme.dart';
import '../../data/repository/authentication_repository.dart';
import '_widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
