import 'package:flutter/material.dart';

class ScorekeeperService extends ChangeNotifier {
  int _scoreToWin = 4000;
  int _redPlayerScore = 0;
  int _bluePlayerScore = 0;

  int get scoreToWin => _scoreToWin;
  int get redPlayerScore => _redPlayerScore;
  int get bluePlayerScore => _bluePlayerScore;

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
}
