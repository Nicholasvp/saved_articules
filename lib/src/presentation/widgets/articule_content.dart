import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saved_articules/src/domain/models/articule_model.dart';
import 'package:saved_articules/src/presentation/controllers/home_controller.dart';
import 'package:saved_articules/src/presentation/widgets/favorite_buttom.dart';
import 'package:saved_articules/src/presentation/widgets/icon_priority.dart';
import 'package:saved_articules/src/presentation/widgets/icon_text.dart';
import 'package:saved_articules/src/presentation/widgets/tag_articule.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';

class ArticuleContent extends StatelessWidget {
  const ArticuleContent({
    super.key,
    required this.articule,
  });
  final ArticuleModel articule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Divider(
              color: Colors.grey,
              thickness: 4,
              indent: 150,
              endIndent: 150,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            articule.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            articule.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Text(
              articule.urlArticule,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              articule.tags.length,
              (index) {
                return TagArticule(tag: articule.tags[index]);
              },
            ),
          ),
          const SizedBox(height: 16),
          IconText(
            icon: const Icon(Icons.access_time_outlined),
            label: '${articule.timeToRead} of reading',
          ),
          const SizedBox(height: 8),
          IconText(
            icon: IconPriority(priority: articule.priority),
            label: '${articule.priority} priority',
          ),
          const SizedBox(height: 8),
          IconText(
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            label:
                'Added on ${DateFormat.yMEd().format(articule.addedAt)} at ${DateFormat.Hm().format(articule.addedAt)}',
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Consumer(builder: (context, ref, _) {
            final controller = ref.read(homeController);
            return FavoriteButtom(
              isFavorite: articule.favorite,
              onPressed: () {
                controller.onFavoriteSelected(articule);
              },
            );
          })
        ],
      ),
    );
  }
}
