import 'package:flutter/material.dart';
import 'package:saved_articules/src/domain/models/articule_model.dart';
import 'package:saved_articules/src/theme/custom_theme.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ProgressArticule extends StatelessWidget {
  const ProgressArticule({
    super.key,
    required this.articule,
    this.radius,
  });

  final ArticuleModel articule;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red[200],
      radius: radius,
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          size: 80,
          angleRange: 360,
          startAngle: -90,
          customWidths: CustomSliderWidths(progressBarWidth: 8, trackWidth: 8),
          customColors: CustomSliderColors(
            progressBarColor: Colors.red,
            trackColor: Colors.red[100],
          ),
          infoProperties: InfoProperties(
            mainLabelStyle: CustomTheme.bodyMedium
                .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            modifier: (double value) {
              return '${value.toInt()}%';
            },
          ),
        ),
        initialValue: articule.progress!.toDouble(),
      ),
    );
  }
}
