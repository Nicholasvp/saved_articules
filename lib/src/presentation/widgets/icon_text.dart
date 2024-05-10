import 'package:flutter/material.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.label,
    required this.icon,
    this.color,
  });

  final String label;
  final Widget icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 16),
        Text(
          label,
          style: CustomTheme.labelStrong.copyWith(color: color),
        ),
      ],
    );
  }
}
