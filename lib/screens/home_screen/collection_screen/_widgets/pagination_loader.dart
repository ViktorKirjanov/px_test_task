import 'package:flutter/material.dart';

import '../../../../config/custom_theme.dart';

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(bottom: CustomTheme.primarySpacing),
        height: 75.0,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
