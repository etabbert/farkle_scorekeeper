import 'dart:ui';

import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/models/players.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/custom_elevated_button.dart';
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
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          title: Center(
            child: FittedBox(
              child: Text('Game Setup',
                  style: CustomTheme.themeData.textTheme.labelLarge),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          'Score to WIN',
                          style: CustomTheme.themeData.textTheme.labelMedium,
                        ),
                      ),
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
                            showSideLabels: true,
                            onChanged: (double value) {
                              scoreKeeperService.setScoreToWin(value.toInt());
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text('First to roll',
                            style: CustomTheme.themeData.textTheme.labelMedium),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          text: 'BLUE',
                          textColor: Colors.white,
                          width: 100,
                          height: 50,
                          color: Colors.blue,
                          isSelected:
                              scoreKeeperService.firstTurn == Player.blue,
                          onPressed: () {
                            scoreKeeperService.setFirstTurn(Player.blue);
                          },
                        ),
                        CustomElevatedButton(
                          text: 'RED',
                          textColor: Colors.white,
                          width: 100,
                          height: 50,
                          color: Colors.red,
                          isSelected:
                              scoreKeeperService.firstTurn == Player.red,
                          onPressed: () {
                            scoreKeeperService.setFirstTurn(Player.red);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                    text: "Cancel",
                    textColor: Colors.white,
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                CustomElevatedButton(
                    text: "Start",
                    textColor: Colors.white,
                    color: Colors.deepPurple,
                    onPressed: scoreKeeperService.firstTurn != Player.none
                        ? () {
                            Navigator.of(context).pop();
                            pageService.goToPageByName("ScoreboardPage");
                          }
                        : null)
              ],
            ),
          ],
        ),
      );
    });
  }
}
