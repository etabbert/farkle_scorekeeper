import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/custom_slider.dart';
import 'package:farkle_scorekeeper/services/page_service.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartGameDialog extends StatelessWidget {
  const StartGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageService, ScorekeeperService>(
        builder: (context, pageService, scoreKeeperService, child) {
      return AlertDialog(
        title: Center(
          child: Text('Game Setup',
              style: CustomTheme.themeData.textTheme.labelLarge),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Score to WIN",
              style: CustomTheme.themeData.textTheme.labelMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSlider(
                    value: scoreKeeperService.scoreToWin,
                    min: 1000,
                    max: 10000,
                    divisions: 18,
                    label: scoreKeeperService.scoreToWin.toString(),
                    onChanged: (double value) {
                      scoreKeeperService.setScoreToWin(value.toInt());
                    }),
              ],
            ),
            const Text("First roll"),
            Row(
              children: [],
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    pageService.goToPageByName("ScoreboardPage");
                  },
                  child: const Text("Start")),
            ],
          ),
        ],
      );
    });
  }
}
