import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/models/die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceHistoryRow extends StatelessWidget {
  final List<Die> dice;
  final String score;

  const DiceHistoryRow({
    super.key,
    required this.dice,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    const int maxDice = 6;
    const double dieSize = 40.0;
    const double spacing = 8.0;

    return Row(
      children: [
        ...List.generate(maxDice, (index) {
          if (index < dice.length) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index < maxDice - 1 ? spacing : 0),
              child: SizedBox(
                width: dieSize,
                height: dieSize,
                child: SvgPicture.asset(
                  dice[index].getAssetString(),
                  width: dieSize,
                  height: dieSize,
                  fit: BoxFit.contain,
                ),
              ),
            );
          } else {
            return const SizedBox(
              width: dieSize + spacing,
              height: dieSize,
            );
          }
        }),
        const Spacer(),
        FittedBox(
          child: Text(
            score,
            style: CustomTheme.themeData.textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
