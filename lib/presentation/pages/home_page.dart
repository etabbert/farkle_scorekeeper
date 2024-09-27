import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageService>(builder: (context, pageService, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Farkle Scorekeeper',
            style: CustomTheme.themeData.textTheme.displayLarge,
          ),
          ElevatedButton(
            onPressed: () {
              pageService.goToPageByName("ScoreboardPage");
            },
            child: const Text('Start Game'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Settings'),
          )
        ],
      );
    });
  }
}
