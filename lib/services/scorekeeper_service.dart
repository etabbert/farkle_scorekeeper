import 'package:farkle_scorekeeper/models/players.dart';
import 'package:flutter/material.dart';

class ScorekeeperService extends ChangeNotifier {
  int _scoreToWin = 4000;
  int _redPlayerScore = 0;
  int _bluePlayerScore = 0;
  Player _firstTurn = Player.none;

  int get scoreToWin => _scoreToWin;
  int get redPlayerScore => _redPlayerScore;
  int get bluePlayerScore => _bluePlayerScore;
  Player get firstTurn => _firstTurn;

  void setScoreToWin(int score) {
    _scoreToWin = score;
    notifyListeners();
  }

  void setRedPlayerScore(int score) {
    _redPlayerScore = score;
    notifyListeners();
  }

  void setBluePlayerScore(int score) {
    _bluePlayerScore = score;
    notifyListeners();
  }

  void setFirstTurn(Player player) {
    _firstTurn = player;
    notifyListeners();
  }

  void resetScores() {
    _redPlayerScore = 0;
    _bluePlayerScore = 0;
    notifyListeners();
  }

  void resetAllValues() {
    _scoreToWin = 4000;
    _redPlayerScore = 0;
    _bluePlayerScore = 0;
    _firstTurn = Player.none;
    notifyListeners();
  }
}
