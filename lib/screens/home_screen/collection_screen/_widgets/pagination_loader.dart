import 'package:flutter/material.dart';

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(bottom: 16.0),
        height: 75.0,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}