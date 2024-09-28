import 'package:farkle_scorekeeper/presentation/scoreboard/main_scoreboard.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScorekeeperService>(
        create: (_) => ScorekeeperService(),
        child: Column(
          children: [
            const Expanded(flex: 1, child: MainScoreboard()),
            Expanded(flex: 6, child: Container())
          ],
        ));
  }
}
