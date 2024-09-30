import 'package:farkle_scorekeeper/models/die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiceButton extends StatelessWidget {
  final Die die;
  const DiceButton({super.key, required this.die});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(die.value);
      },
      child: SvgPicture.asset(
        die.getAssetString(),
        fit: BoxFit.contain,
      ),
    );
  }
}
