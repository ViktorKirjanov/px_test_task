import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:px_test_task/blocs/signin_cubit/signin_cubit.dart';
import 'package:px_test_task/screens/_widgets/buttons/primary_button.dart';
import 'package:px_test_task/screens/_widgets/buttons/primary_loading_button.dart';
import 'package:px_test_task/screens/_widgets/custom_messenger.dart';
import 'package:px_test_task/screens/home_screen/home_screen.dart';
import 'package:px_test_task/screens/signin_screen/_widgets/email_input.dart';
import 'package:px_test_task/screens/signin_screen/_widgets/password_input.dart';
import 'package:px_test_task/screens/signin_screen/_widgets/recover.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<SignInCubit, SignInState>(
        listener: (_, state) {
          if (state.status.isSubmissionFailure) {
            CustomMessager().showError(
              context: context,
              message: state.errorMessage ??
                  'Something went wrong, please try again.',
            );
          } else if (state.status.isSubmissionSuccess) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushAndRemoveUntil(
              MaterialPageRoute<bool>(
                builder: (BuildContext context) => const HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 35.0),
            _EmailInput(),
            const SizedBox(height: 13.0),
            _PasswordInput(),
            const SizedBox(height: 40.0),
            _LogInButton(),
            const SizedBox(height: 40.0),
            const Recover()
          ],
        ),
      );
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (_, state) => EmailInput(
          errorText: state.email.invalid ? 'Invalid email' : null,
          onChanged: (String email) =>
              context.read<SignInCubit>().emailChanged(email),
        ),
      );
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => PasswordInput(
          errorText: state.password.invalid ? 'Invalid password' : null,
          onChanged: (String password) =>
              context.read<SignInCubit>().passwordChanged(password),
        ),
      );
}

class _LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (_, state) {
          if (state.status.isSubmissionInProgress) {
            return const PrimaryLoadingButton();
          }

          return PrimaryButton(
            active: state.status.isValidated,
            title: 'Continue',
            onPressed: state.status.isValidated
                ? () => context.read<SignInCubit>().logInWithCredentials()
                : () {},
          );
        },
      );
}
