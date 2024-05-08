import 'package:flutter/material.dart';
import 'package:saved_articules/src/presentation/controllers/home_controller.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';

class MyTags extends StatelessWidget {
  const MyTags({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: controller.tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tag = controller.tags[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: tag.isSelected ? Colors.red : Colors.red[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                controller.onTagSelected(tag);
              },
              child: Center(
                child: Text(
                  tag.title,
                  style: CustomTheme.bodySmall.copyWith(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
