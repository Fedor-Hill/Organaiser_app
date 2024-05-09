import 'package:flutter/material.dart';

class MyLoadWidget extends StatelessWidget {
  const MyLoadWidget({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth <= 600) {
        return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 69),
              child: LinearProgressIndicator(),
            ),
          );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }
  );
}
