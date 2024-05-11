import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saved_articules/src/presentation/controllers/home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SvgPicture.asset(
            'assets/icons/settings.svg',
          ),
        ),
      ),
      actions: [
        AnimSearchBar(
          width: 200,
          textController: controller.store.searchController,
          onSuffixTap: (text) => controller.onSearch(text),
          onSubmitted: (text) => controller.onSearch(text),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
