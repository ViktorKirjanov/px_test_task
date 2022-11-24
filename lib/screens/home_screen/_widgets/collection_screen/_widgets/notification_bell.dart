import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/custom_theme.dart';

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
              SvgPicture.asset(
                'assets/svg/bell.svg',
                color: CustomTheme.white,
              ),
              Positioned(
                right: .0,
                bottom: 2.0,
                child: Container(
                  height: 8.0,
                  width: 8.0,
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
