import 'package:flutter/material.dart';

class MyLineInfo extends StatelessWidget {
  const MyLineInfo({
    super.key,
    required this.title, this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.square_rounded, color: color ?? theme.colorScheme.primary),
        const SizedBox(width: 5),
        Text(
          title,
          textAlign: TextAlign.left,
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(width: 5),
        Expanded(child: Divider(thickness: 2, color: color))
      ],
    );
  }
}

