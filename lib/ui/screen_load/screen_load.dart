import 'package:flutter/material.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          //For mobile Screen
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 69),
              child: LinearProgressIndicator(),
            ),
          );
          //For PC screen
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
