// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:px_test_task/blocs/signin_cubit/signin_cubit.dart';
import 'package:px_test_task/data/repository/authentication_repository.dart';
import 'package:px_test_task/utils/form_inputs/email.dart';
import 'package:px_test_task/utils/form_inputs/password.dart';

import '../../consts.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('SignInCubit.', () {
    late AuthenticationRepository authenticationRepository;
    late SignInCubit signInCubit;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      signInCubit = SignInCubit(authenticationRepository);

      when(
        () => authenticationRepository.logInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => {});
    });

    test('initial state is SignInState', () {
      expect(
        SignInCubit(authenticationRepository).state,
        SignInState(),
      );
    });

    group('emailChanged.', () {
      blocTest<SignInCubit, SignInState>(
        'emits [invalid] when email/password are invalid. ',
        build: () => signInCubit,
        act: (SignInCubit cubit) => cubit.emailChanged(invalidEmail),
        expect: () => <SignInState>[
          SignInState(
            email: Email.dirty(invalidEmail),
            status: FormzStatus.invalid,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'emits [valid] when email/password are valid',
        build: () => signInCubit,
        seed: () => SignInState(password: Password.dirty(validPassword)),
        act: (SignInCubit cubit) => cubit.emailChanged(validEmail),
        expect: () => <SignInState>[
          SignInState(
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('passwordChanged.', () {
      blocTest<SignInCubit, SignInState>(
        'emits [invalid] when email/password are invalid',
        build: () => signInCubit,
        act: (SignInCubit cubit) => cubit.passwordChanged(invalidPassword),
        expect: () => <SignInState>[
          SignInState(
            password: Password.dirty(invalidPassword),
            status: FormzStatus.invalid,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'emits [valid] when email/password are valid',
        build: () => signInCubit,
        seed: () => SignInState(email: Email.dirty(validEmail)),
        act: (SignInCubit cubit) => cubit.passwordChanged(validPassword),
        expect: () => <SignInState>[
          SignInState(
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('logInWithCredentials.', () {
      blocTest<SignInCubit, SignInState>(
        'Does nothing when status is not validated',
        build: () => signInCubit,
        act: (SignInCubit cubit) => cubit.logInWithCredentials(),
        expect: () => <SignInState>[],
      );

      blocTest<SignInCubit, SignInState>(
        'Calls logInWithEmailAndPassword with correct email and password',
        build: () => signInCubit,
        seed: () => SignInState(
          status: FormzStatus.valid,
          email: Email.dirty(validEmail),
          password: Password.dirty(validPassword),
        ),
        act: (SignInCubit cubit) => cubit.logInWithCredentials(),
        verify: (_) {
          verify(
            () => authenticationRepository.logInWithEmailAndPassword(
              email: validEmail,
              password: validPassword,
            ),
          ).called(1);
        },
      );

      blocTest<SignInCubit, SignInState>(
        'emits [submissionInProgress, submissionFailure] '
        'when logInWithEmailAndPassword fails',
        setUp: () {
          when(
            () => authenticationRepository.logInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => signInCubit,
        seed: () => SignInState(
          status: FormzStatus.valid,
          email: Email.dirty(validEmail),
          password: Password.dirty(validPassword),
        ),
        act: (SignInCubit cubit) => cubit.logInWithCredentials(),
        expect: () => <SignInState>[
          SignInState(
            status: FormzStatus.submissionInProgress,
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
          ),
          SignInState(
            status: FormzStatus.submissionFailure,
            email: Email.dirty(validEmail),
            password: Password.dirty(validPassword),
          )
        ],
      );
    });
  });
}
