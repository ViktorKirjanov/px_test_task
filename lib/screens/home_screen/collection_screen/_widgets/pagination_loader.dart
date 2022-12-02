import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(bottom: CustomTheme.mediumSpacing),
          height: 75.0,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
