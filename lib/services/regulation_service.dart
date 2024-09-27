import 'package:farkle_scorekeeper/models/die.dart';
import 'package:flutter/material.dart';

class RegulationService extends ChangeNotifier {
  int diceRegulation(List<Die> dice) {
    switch (dice.length) {
      case 1:
        oneDieRegulation(dice.first);
        break;
      case 2:
        twoDiceRegulation(dice);
        break;
      case 3:
        threeDiceRegulation(dice);
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      default:
        null;
    }
    return 100;
  }

  int oneDieRegulation(Die die) {
    if (die.value == 1) {
      return 100;
    } else if (die.value == 5) {
      return 50;
    } else {
      return 0;
    }
  }

  int twoDiceRegulation(List<Die> dice) {
    var pointSum = 0;
    for (var die in dice) {
      pointSum += oneDieRegulation(die);
    }
    return pointSum;
  }

  int threeDiceRegulation(List<Die> dice) {
    var pointSum = 0;
    var uniqueDice = dice.toSet();
    if (uniqueDice.length == 1) {
      if (uniqueDice.first.value == 1) {
        pointSum += 300;
      } else {
        pointSum += uniqueDice.first.value * 100;
      }
    } else {
      for (var die in dice) {
        pointSum += oneDieRegulation(die);
      }
    }
    return pointSum;
  }

  int fourDiceRegulation(List<Die> dice) {
    var pointSum = 0;
    var uniqueDice = dice.toSet();
    if (uniqueDice.length == 1) {
      pointSum += 1000;
    } else if (uniqueDice.length == 2) {
      for (var uniqueDie in uniqueDice) {
        var countedDice = dice.where((die) => die.value == uniqueDie.value);
        if (countedDice.length == 3) {
          pointSum += threeDiceRegulation(countedDice.toList());
        } else {
          for (var oneDie in countedDice) {
            pointSum += oneDieRegulation(oneDie);
          }
        }
      }
    } else {
      for (var die in dice) {
        pointSum += oneDieRegulation(die);
      }
    }
    return pointSum;
  }
}
