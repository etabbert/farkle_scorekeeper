import 'package:farkle_scorekeeper/models/die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiceImage extends StatelessWidget {
  final Die die;
  const DiceImage({super.key, required this.die});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      die.getAssetString(),
      fit: BoxFit.contain,
    );
  }
}
