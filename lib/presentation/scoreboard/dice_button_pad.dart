import 'package:farkle_scorekeeper/models/die.dart';
import 'package:farkle_scorekeeper/presentation/custom_widgets/dice_button.dart';
import 'package:flutter/material.dart';

class DiceButtonPad extends StatelessWidget {
  const DiceButtonPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: DiceButton(die: Die(initialValue: 1))),
                Expanded(child: DiceButton(die: Die(initialValue: 2))),
                Expanded(child: DiceButton(die: Die(initialValue: 3))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: DiceButton(die: Die(initialValue: 4))),
                Expanded(child: DiceButton(die: Die(initialValue: 5))),
                Expanded(child: DiceButton(die: Die(initialValue: 6))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
