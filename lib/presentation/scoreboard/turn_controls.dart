import 'package:farkle_scorekeeper/presentation/custom_widgets/custom_elevated_button.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TurnControls extends StatelessWidget {
  const TurnControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScorekeeperService>(
        builder: (context, scorekeeperService, child) {
      return LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                  text: "Farkle!",
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  width: constraints.maxWidth / 3,
                  height: constraints.maxHeight,
                  onPressed: () {}),
              CustomElevatedButton(
                  text: "End Turn",
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  width: constraints.maxWidth / 3,
                  height: constraints.maxHeight,
                  onPressed: () {})
            ],
          ),
        );
      });
    });
  }
}
