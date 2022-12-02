import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class ProductGroups extends StatefulWidget {
  const ProductGroups({super.key});

  @override
  ProductGroupsState createState() => ProductGroupsState();
}

class ProductGroupsState extends State<ProductGroups> {
  var _index = 1;

  void _changeIndex(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.topCenter,
        child: Container(
          height: 32,
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: CustomTheme.black3,
            borderRadius: BorderRadius.all(
              Radius.circular(CustomTheme.smallSpacing),
            ),
          ),
          child: Row(
            children: <Widget>[
              _GroupButton(
                title: 'Details',
                isSelectd: _index == 1,
                pressed: () => _changeIndex(1),
              ),
              _GroupButton(
                title: 'Tasting notes',
                isSelectd: _index == 2,
                pressed: () => _changeIndex(2),
              ),
              _GroupButton(
                title: 'History',
                isSelectd: _index == 3,
                pressed: () => _changeIndex(3),
              ),
            ],
          ),
        ),
      );
}

class _GroupButton extends StatelessWidget {
  const _GroupButton({
    required this.title,
    required this.isSelectd,
    required this.pressed,
  });

  final String title;
  final bool isSelectd;
  final void Function()? pressed;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Material(
          color: isSelectd ? CustomTheme.primary : Colors.transparent,
          borderRadius: CustomTheme.borderRadius,
          child: InkWell(
            splashColor: CustomTheme.splashColor,
            highlightColor: CustomTheme.highlightColor,
            borderRadius: CustomTheme.borderRadius,
            onTap: pressed,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: isSelectd ? CustomTheme.black3 : CustomTheme.grey3,
                  fontSize: 12,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ),
        ),
      );
}
