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
      return LayoutBuilder(builder: (context, constraints) {
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
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            height: constraints.maxHeight / 12,
                            width: constraints.maxWidth,
                            child: _buildPlayerLabel(item, context)),
                      );
                    } else if (item is DiceRollItem) {
                      return _buildDiceRoll(item, context);
                    } else if (item is FarkleItem) {
                      return SizedBox(
                          height: constraints.maxHeight / 8,
                          width: constraints.maxWidth,
                          child: _buildFarkleItem());
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

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: dividerColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FittedBox(
            child: Text(item.playerName,
                style: CustomTheme.themeData.textTheme.displayMedium),
          ),
        ),
      ),
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

  Widget _buildFarkleItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150.0, vertical: 4.0),
      child: FittedBox(
        child: Text(
          'Farkle!',
          style: CustomTheme.themeData.textTheme.labelMedium,
        ),
      ),
    );
  }
}
