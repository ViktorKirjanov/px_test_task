import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class EndOfList extends StatelessWidget {
  const EndOfList({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(bottom: CustomTheme.mediumSpacing),
          height: 75.0,
          child: const Center(
            child: Text(
              'No more products',
              style: TextStyle(
                color: CustomTheme.grey1,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
        ),
      );
}
