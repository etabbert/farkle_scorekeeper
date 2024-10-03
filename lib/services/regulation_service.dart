import 'package:farkle_scorekeeper/models/die.dart';

class RegulationService {
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
        switch (count) {
          case 3:
            if (i == 1) {
              score += 100 * 3;
            } else {
              score += i * 100;
            }
            break;
          case 4:
            score += 1000;
            break;
          case 5:
            score += 2500;
            break;
          case 6:
            score += 3000;
            break;
        }

        counts[i] = 0;
      }
    }

    score += (counts[1] ?? 0) * 100;
    score += (counts[5] ?? 0) * 50;

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
