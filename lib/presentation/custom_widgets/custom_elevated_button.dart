import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final bool isSelected;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.width = 75,
    this.height = 35,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return color.withOpacity(0.5);
            } else if (isSelected) {
              return darkenColor(color);
            }
            return color;
          },
        ),
        foregroundColor: WidgetStateProperty.all(textColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? Colors.white : Colors.transparent,
              width: isSelected ? 5 : 0,
            ),
          ),
        ),
        fixedSize: WidgetStateProperty.all(Size(width, height)),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }

  Color darkenColor(Color color, [double amount = 0.2]) {
    final hsl = HSLColor.fromColor(color);
    final darkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}
