import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/custom_elevated_button.dart';
import 'package:farkle_scorekeeper/presentation/main_menu/start_game_dialog.dart';
import 'package:farkle_scorekeeper/services/page_service.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageService, ScorekeeperService>(
        builder: (context, pageService, scoreKeeperService, child) {
      return LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Farkle Scorekeeper',
                      style: CustomTheme.themeData.textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(
                      text: "Start Game",
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      width: 150,
                      height: 50,
                      onPressed: () async {
                        scoreKeeperService.resetAllValues();
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return const StartGameDialog();
                            });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(
                      text: "Settings",
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      width: 150,
                      height: 50,
                      onPressed: () {
                        pageService.goToPageByName("SettingsPage");
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
