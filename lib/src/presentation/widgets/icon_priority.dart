import 'package:flutter/material.dart';

class IconPriority extends StatelessWidget {
  const IconPriority({super.key, required this.priority});
  final String priority;

  @override
  Widget build(BuildContext context) {
    return switch (priority) {
      'high' => const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.yellow,
        ),
      'medium' => const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.blue,
        ),
      'low' => const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.green,
        ),
      _ => const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.grey,
        )
    };
  }
}
