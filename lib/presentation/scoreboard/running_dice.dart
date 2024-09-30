import 'package:farkle_scorekeeper/presentation/custom_widgets/dice_image.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RunningDice extends StatelessWidget {
  const RunningDice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScorekeeperService>(
      builder: (context, scorekeeperService, child) {
        final int totalDice = scorekeeperService.runningDice.length;

        return LayoutBuilder(
          builder: (context, constraints) {
            double diceSize = (constraints.maxWidth - 16 * (totalDice - 1)) / 6;

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...scorekeeperService.runningDice.map((die) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: diceSize,
                          height: diceSize,
                          child: DiceImage(die: die),
                        ),
                      ),
                    )),
                ...List.generate(
                  6 - totalDice,
                  (index) => Expanded(
                    child: SizedBox(
                      width: diceSize,
                      height: diceSize,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
