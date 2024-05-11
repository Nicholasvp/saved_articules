import 'package:flutter/material.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';

class FavoriteButtom extends StatelessWidget {
  const FavoriteButtom({
    super.key,
    this.isFavorite,
    required this.onPressed,
  });

  final bool? isFavorite;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: CustomTheme.buttomRed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isFavorite ?? false
              ? const Icon(
                  Icons.star,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
          const SizedBox(width: 8),
          Text(
            isFavorite ?? false ? 'Remove from Favorite' : 'Add on Favorite',
            style: CustomTheme.labelStrong.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
