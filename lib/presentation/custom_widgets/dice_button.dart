import 'package:farkle_scorekeeper/models/die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiceButton extends StatelessWidget {
  final Die die;
  const DiceButton({super.key, required this.die});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double size = constraints.maxWidth;

        return SizedBox(
          width: size,
          height: size,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SvgPicture.asset(
              die.getAssetString(),
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
