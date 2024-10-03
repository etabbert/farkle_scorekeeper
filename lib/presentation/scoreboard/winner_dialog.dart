import 'dart:ui';

import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/models/players.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/custom_elevated_button.dart';
import 'package:farkle_scorekeeper/services/page_service.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WinnerDialog extends StatelessWidget {
  final Player winner;
  const WinnerDialog({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageService, ScorekeeperService>(
        builder: (context, pageService, scoreKeeperService, child) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Text(
              winner == Player.red ? "Red Player Wins!" : "Blue Player Wins!",
              style: CustomTheme.themeData.textTheme.displayLarge),
          actions: [
            CustomElevatedButton(
                text: "Main Menu",
                textColor: Colors.white,
                color: Colors.deepPurple,
                onPressed: scoreKeeperService.currentPlayer != Player.none
                    ? () {
                        Navigator.of(context).pop();
                        pageService.goToPageByName("HomePage");
                      }
                    : null)
          ],
        ),
      );
    });
  }
}
