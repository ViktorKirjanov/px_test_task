import 'package:flutter/material.dart';

import '_widgets/notification_bell.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My collection'),
        centerTitle: false,
        actions: const [
          NotificationBell(),
        ],
      ),
      body: const Center(
        child: Text(
          "Collection screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
