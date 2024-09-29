import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final int divisions;
  final String label;
  final bool showSideLabels;
  final Function(double) onChanged;

  const CustomSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    this.divisions = 10,
    required this.label,
    this.showSideLabels = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showSideLabels
            ? FittedBox(
                child: Text(
                  min.toString(),
                  style: CustomTheme.themeData.textTheme.labelSmall,
                ),
              )
            : const SizedBox.shrink(),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.deepPurple,
            inactiveTrackColor: Colors.deepPurple[100],
            trackHeight: 8.0,
            thumbColor: Colors.deepPurple,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            overlayColor: Colors.deepPurple.withAlpha(32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
          ),
          child: Slider(
            value: value.toDouble(),
            min: min.toDouble(),
            max: max.toDouble(),
            label: label,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
        showSideLabels
            ? FittedBox(
                child: Text(
                  max.toString(),
                  style: CustomTheme.themeData.textTheme.labelSmall,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
