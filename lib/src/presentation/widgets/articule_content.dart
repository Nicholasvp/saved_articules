import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saved_articules/src/domain/models/helpers/helper.dart';
import 'package:saved_articules/src/presentation/controllers/home_controller.dart';
import 'package:saved_articules/src/presentation/widgets/favorite_buttom.dart';
import 'package:saved_articules/src/presentation/widgets/icon_priority.dart';
import 'package:saved_articules/src/presentation/widgets/icon_text.dart';
import 'package:saved_articules/src/presentation/widgets/progress_articule.dart';
import 'package:saved_articules/src/presentation/widgets/tag_articule.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticuleContent extends ConsumerWidget {
  const ArticuleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeController);
    final articule = controller.store.articuleSelected!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                ProgressArticule(
                  articule: controller.store.articuleSelected!,
                  radius: 30,
                ),
              ],
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
            Text(
              Helper.getHostUrl(articule.urlArticule),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
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
              label: controller.formatterDate(articule.addedAt),
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Consumer(
              builder: (context, ref, _) {
                var favorite =
                    ref.watch(homeController).getArticule(articule).favorite;
                return FavoriteButtom(
                  isFavorite: favorite,
                  onPressed: () => controller.onFavoriteSelected(articule),
                );
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                      articule.urlArticule,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  style: CustomTheme.buttomWhite,
                  child: const Text(
                    'OPEN IN BROWSER',
                    style: CustomTheme.labelStrong,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: CustomTheme.buttomBlack,
                  child: Text(
                    'OPEN IN APP',
                    style:
                        CustomTheme.labelStrong.copyWith(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
