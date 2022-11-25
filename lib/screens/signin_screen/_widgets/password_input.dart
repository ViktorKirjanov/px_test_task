import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/simlpe_switch_cubit/simlpe_switch_cubit.dart';
import '../../../config/custom_theme.dart';
import '../../_widgets/svg_icon.dart';

class PasswordInput extends StatefulWidget {
  final String? labelText;
  final String? errorText;
  final Function onChanged;

  const PasswordInput({
    Key? key,
    this.labelText,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final SimlpeSwitchCubit _simlpeSwitchCubit = SimlpeSwitchCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimlpeSwitchCubit, bool>(
      bloc: _simlpeSwitchCubit,
      builder: (_, state) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: widget.errorText,
            suffixIcon: GestureDetector(
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
              onTap: () => _simlpeSwitchCubit.onSwitch(),
            ),
          ),
          obscureText: state,
          onChanged: (val) => widget.onChanged(val),
        );
      },
    );
  }
}
