import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/dice_history_row.dart';
import 'package:farkle_scorekeeper/services/regulation_service.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoringHistory extends StatelessWidget {
  const ScoringHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScorekeeperService>(
        builder: (context, scoreKeeperService, child) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                'Scoring History',
                style: CustomTheme.themeData.textTheme.labelLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: scoreKeeperService.previousRolls.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: DiceHistoryRow(
                      dice: scoreKeeperService.previousRolls[index],
                      score: RegulationService()
                          .calculateScore(
                              scoreKeeperService.previousRolls[index])
                          .toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
