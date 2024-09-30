import 'package:farkle_scorekeeper/models/die.dart';
import 'list_item.dart';

class DiceRollItem extends ListItem {
  final List<Die> dice;
  final int score;

  DiceRollItem({required this.dice, required this.score});
}

class PlayerLabelItem extends ListItem {
  final String playerName;

  PlayerLabelItem({required this.playerName});
}

class FarkleItem extends ListItem {
  FarkleItem();
}
