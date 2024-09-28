import 'package:flutter/material.dart';

class ScorekeeperService extends ChangeNotifier {
  int _scoreToWin = 0;
  int _player1Score = 0;
  int _player2Score = 0;

  int get scoreToWin => _scoreToWin;
  int get player1Score => _player1Score;
  int get player2Score => _player2Score;

  void setScoreToWin(int score) {
    _scoreToWin = score;
    notifyListeners();
  }

  void setPlayer1Score(int score) {
    _player1Score = score;
    notifyListeners();
  }

  void setPlayer2Score(int score) {
    _player2Score = score;
    notifyListeners();
  }
}
