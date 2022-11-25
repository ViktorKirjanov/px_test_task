import 'package:flutter/cupertino.dart';

import '../../../../config/custom_theme.dart';
import '../../../_widgets/svg_icon.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: SizedBox(
        height: 40.0,
        width: 40.0,
        child: Center(
          child: Stack(
            children: [
              const SvgIcon(
                name: 'bell',
                color: CustomTheme.white,
              ),
              Positioned(
                right: .0,
                bottom: 2.0,
                child: Container(
                  height: CustomTheme.smallSpacing,
                  width: CustomTheme.smallSpacing,
                  decoration: BoxDecoration(
                    color: CustomTheme.error,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: CustomTheme.black2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
