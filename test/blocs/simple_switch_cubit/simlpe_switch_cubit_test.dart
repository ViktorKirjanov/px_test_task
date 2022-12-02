import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:px_test_task/blocs/simlpe_switch_cubit/simlpe_switch_cubit.dart';

void main() {
  group('SimlpeSwitchCubit.', () {
    final SimlpeSwitchCubit cubit = SimlpeSwitchCubit();

    test('initial state is true', () {
      expect(
        SimlpeSwitchCubit().state,
        true,
      );
    });

    blocTest<SimlpeSwitchCubit, bool>(
      'emits false onSwitch. ',
      build: () => cubit,
      act: (SimlpeSwitchCubit cubit) => cubit.onSwitch(),
      expect: () => <bool>[false],
    );
  });
}
