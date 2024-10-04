import 'package:farkle_scorekeeper/presentation/scoreboard/dice_button_pad.dart';
import 'package:farkle_scorekeeper/presentation/scoreboard/main_scoreboard.dart';
import 'package:farkle_scorekeeper/presentation/scoreboard/running_dice.dart';
import 'package:farkle_scorekeeper/presentation/scoreboard/scoring_history.dart';
import 'package:farkle_scorekeeper/presentation/scoreboard/turn_controls.dart';
import 'package:flutter/material.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: constraints.maxHeight - constraints.maxHeight / 7.3,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: ScoringHistory()),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            const Expanded(flex: 2, child: RunningDice()),
                            Expanded(
                              flex: 3,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth / 3,
                                ),
                                child: const DiceButtonPad(),
                              ),
                            ),
                            const Expanded(flex: 1, child: TurnControls())
                          ],
                        ))
                  ],
                )),
          ),
          SizedBox(
              height: constraints.maxHeight / 7,
              width: constraints.maxWidth,
              child: const MainScoreboard()),
        ],
      );
    });
  }
}
