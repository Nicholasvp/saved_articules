import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saved_articules/src/presentation/controllers/home_controller.dart';
import 'package:saved_articules/src/presentation/widgets/card_articule.dart';
import 'package:saved_articules/src/presentation/widgets/home_app_bar.dart';
import 'package:saved_articules/src/presentation/widgets/my_tags.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeController);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Articules Saved',
              style: CustomTheme.title,
            ),
            const SizedBox(height: 16),
            controller.tags.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MyTags(controller: controller),
            controller.isLoading
                ? const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Loading articules...',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Flexible(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.articules.length,
                        itemBuilder: (context, index) {
                          final articule = controller.articules[index];
                          return CardArticule(
                              articule: articule, controller: controller);
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
