import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/models/dice_roll_item.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/dice_history_row.dart';
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      'Scoring History',
                      style: CustomTheme.themeData.textTheme.labelLarge,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      scoreKeeperService.runningTotal.toString(),
                      style: CustomTheme.themeData.textTheme.labelLarge,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 4,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: scoreKeeperService.historyItems.length,
                itemBuilder: (context, index) {
                  final item = scoreKeeperService.historyItems[index];
                  if (item is PlayerLabelItem) {
                    return _buildPlayerLabel(item, context);
                  } else if (item is DiceRollItem) {
                    return _buildDiceRoll(item, context);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPlayerLabel(PlayerLabelItem item, BuildContext context) {
    Color dividerColor;
    switch (item.playerName) {
      case 'Red':
        dividerColor = Colors.red;
        break;
      case 'Blue':
        dividerColor = Colors.blue;
        break;
      default:
        dividerColor = Colors.grey;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Divider(
            thickness: 4.0,
            color: dividerColor,
          ),
        ),
        FittedBox(
          child: Text(item.playerName,
              style: CustomTheme.themeData.textTheme.labelMedium),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Divider(
            thickness: 4.0,
            color: dividerColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDiceRoll(DiceRollItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: DiceHistoryRow(
        dice: item.dice,
        score: item.score,
      ),
    );
  }
}
