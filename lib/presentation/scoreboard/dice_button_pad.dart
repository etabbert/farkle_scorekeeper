import 'package:farkle_scorekeeper/models/die.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/custom_elevated_button.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/dice_button.dart';
import 'package:flutter/material.dart';

class DiceButtonPad extends StatelessWidget {
  const DiceButtonPad({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        double buttonSize = width / 3;

        if (height < buttonSize * 3) {
          buttonSize = height / 3;
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  _buildExpandedDiceButton(Die(initialValue: 1)),
                  _buildExpandedDiceButton(Die(initialValue: 2)),
                  _buildExpandedDiceButton(Die(initialValue: 3)),
                  _buildSideButton("Remove", () {}),
                ],
              ),
              Row(
                children: [
                  _buildExpandedDiceButton(Die(initialValue: 4)),
                  _buildExpandedDiceButton(Die(initialValue: 5)),
                  _buildExpandedDiceButton(Die(initialValue: 6)),
                  _buildSideButton("Clear", () {}),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExpandedDiceButton(Die die) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: AspectRatio(aspectRatio: 1, child: DiceButton(die: die)),
      ),
    );
  }

  Widget _buildSideButton(String label, Function() onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          margin: const EdgeInsets.all(4.0),
          child: CustomElevatedButton(
            text: label,
            color: Colors.deepPurple,
            textColor: Colors.white,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
