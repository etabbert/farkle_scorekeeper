import 'package:farkle_scorekeeper/presentation/scoreboard/dice_button_pad.dart';
import 'package:farkle_scorekeeper/presentation/scoreboard/main_scoreboard.dart';
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
                    Expanded(flex: 1, child: Container()),
                    const Expanded(flex: 1, child: DiceButtonPad())
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
