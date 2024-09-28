import 'package:farkle_scorekeeper/presentation/scoreboard/main_scoreboard.dart';
import 'package:flutter/material.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          const Expanded(flex: 1, child: MainScoreboard()),
          Expanded(flex: 6, child: Container())
        ],
      );
    });
  }
}
