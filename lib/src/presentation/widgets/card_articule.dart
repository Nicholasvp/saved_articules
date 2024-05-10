import 'package:flutter/material.dart';
import 'package:saved_articules/src/domain/models/articule_model.dart';
import 'package:saved_articules/src/presentation/controllers/home_controller.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CardArticule extends StatelessWidget {
  const CardArticule({
    super.key,
    required this.articule,
    required this.controller,
  });

  final ArticuleModel articule;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.openArticule(articule, context);
      },
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 120,
            child: Row(
              children: [
                Container(
                  width: 30,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                        articule.urlFavicon,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            articule.title,
                            style: CustomTheme.title,
                          ),
                          const SizedBox(width: 8),
                          if (articule.favorite)
                            const Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        articule.tags
                            .reduce((value, element) => '$value, $element'),
                        style: CustomTheme.label,
                      ),
                      Text(
                        '${articule.timeToRead} reading',
                        style: CustomTheme.label,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.red[200],
            radius: 40,
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(
                size: 80,
                angleRange: 360,
                startAngle: -90,
                customWidths:
                    CustomSliderWidths(progressBarWidth: 8, trackWidth: 8),
                customColors: CustomSliderColors(
                  progressBarColor: Colors.red,
                  trackColor: Colors.red[100],
                ),
                infoProperties: InfoProperties(
                  mainLabelStyle: CustomTheme.bodyMedium.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  modifier: (double value) {
                    return '${value.toInt()}%';
                  },
                ),
              ),
              initialValue: articule.progress!.toDouble(),
            ),
          )
        ],
      ),
    );
  }
}
