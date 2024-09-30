import 'package:farkle_scorekeeper/models/die.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DiceButton extends StatelessWidget {
  final Die die;
  const DiceButton({super.key, required this.die});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScorekeeperService>(
        builder: (context, scorekeeperService, child) {
      return GestureDetector(
        onTap: () {
          scorekeeperService.addToRunningDice(die);
        },
        child: SvgPicture.asset(
          die.getAssetString(),
          fit: BoxFit.contain,
        ),
      );
    });
  }
}
