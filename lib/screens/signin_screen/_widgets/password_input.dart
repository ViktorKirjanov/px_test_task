import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px_test_task/blocs/simlpe_switch_cubit/simlpe_switch_cubit.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/screens/_widgets/svg_icon.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    this.labelText,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);

  final String? labelText;
  final String? errorText;
  final void Function(String) onChanged;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final SimlpeSwitchCubit _simlpeSwitchCubit = SimlpeSwitchCubit();

  @override
  Widget build(BuildContext context) => BlocBuilder<SimlpeSwitchCubit, bool>(
        bloc: _simlpeSwitchCubit,
        builder: (_, state) => TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: widget.errorText,
            suffixIcon: GestureDetector(
              onTap: _simlpeSwitchCubit.onSwitch,
              child: Container(
                width: 50.0,
                padding: const EdgeInsets.only(
                  right: CustomTheme.smallSpacing,
                ),
                child: SvgIcon(
                  name: state ? 'eye_crossed' : 'eye',
                  color: CustomTheme.secondary,
                ),
              ),
            ),
          ),
          obscureText: state,
          onChanged: widget.onChanged,
        ),
      );
}
