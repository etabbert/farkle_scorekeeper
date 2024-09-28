import 'package:farkle_scorekeeper/models/die.dart';
import 'package:flutter/material.dart';

class ScoreService extends ChangeNotifier {
  int calculateScore(List<Die> diceValues) {
    if (diceValues.length > 6) {
      throw ArgumentError('You can roll a maximum of 6 dice.');
    }

    Map<int, int> counts = {};

    for (var die in diceValues) {
      if (die.value < 1 || die.value > 6) {
        throw ArgumentError('Die values must be between 1 and 6.');
      }
      counts[die.value] = (counts[die.value] ?? 0) + 1;
    }

    int score = 0;

    if (_isStraight(counts)) {
      return 1500;
    }

    if (_isThreePairs(counts)) {
      return 1500;
    }

    if (_isTwoTriplets(counts)) {
      return 2500;
    }

    if (_isFourOfAKindAndPair(counts)) {
      return 1500;
    }

    for (int i = 1; i <= 6; i++) {
      int count = counts[i] ?? 0;

      if (count >= 3) {
        int baseScore = i == 1 ? 1000 : i * 100;
        score += baseScore * (1 << (count - 3));
      }

      if (i == 1 && count < 3) {
        score += count * 100;
      } else if (i == 5 && count < 3) {
        score += count * 50;
      }
    }

    return score;
  }

  bool _isStraight(Map<int, int> counts) {
    return counts.length == 6 && counts.values.every((count) => count == 1);
  }

  bool _isThreePairs(Map<int, int> counts) {
    return counts.length == 3 && counts.values.every((count) => count == 2);
  }

  bool _isTwoTriplets(Map<int, int> counts) {
    return counts.length == 2 && counts.values.every((count) => count == 3);
  }

  bool _isFourOfAKindAndPair(Map<int, int> counts) {
    return counts.length == 2 &&
        counts.values.contains(4) &&
        counts.values.contains(2);
  }
}
