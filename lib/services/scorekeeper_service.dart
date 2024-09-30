import 'package:farkle_scorekeeper/models/die.dart';
import 'package:farkle_scorekeeper/models/players.dart';
import 'package:farkle_scorekeeper/services/regulation_service.dart';
import 'package:flutter/material.dart';

class ScorekeeperService extends ChangeNotifier {
  int _scoreToWin = 4000;
  int _redPlayerScore = 0;
  int _bluePlayerScore = 0;
  Player _currentPlayer = Player.none;
  int _runningTotal = 0;
  int _rollTotal = 0;
  List<Die> _runningDice = [];
  List<List<Die>> _previousRolls = [];

  final RegulationService _regulationService = RegulationService();

  int get scoreToWin => _scoreToWin;
  int get redPlayerScore => _redPlayerScore;
  int get bluePlayerScore => _bluePlayerScore;
  Player get currentPlayer => _currentPlayer;
  int get runningTotal => _runningTotal;
  int get rollTotal => _rollTotal;
  List<Die> get runningDice => _runningDice;
  List<List<Die>> get previousRolls => _previousRolls;

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

  void setCurrentPlayer(Player player) {
    _currentPlayer = player;
    notifyListeners();
  }

  void setRunningTotal(int total) {
    _runningTotal = total;
    notifyListeners();
  }

  void setRollTotal(int total) {
    _rollTotal = total;
    notifyListeners();
  }

  void setRunningDice(List<Die> runningDice) {
    _runningDice = runningDice;
    notifyListeners();
  }

  void addToRunningDice(Die die) {
    if (_runningDice.length < 6) {
      _runningDice.add(die);
      print(_regulationService.calculateScore(_runningDice));
    }
    notifyListeners();
  }

  void resetRunningDice() {
    _runningDice = [];
    notifyListeners();
  }

  void removeLastRunningDie() {
    if (_runningDice.isNotEmpty) _runningDice.removeLast();

    notifyListeners();
  }

  void setPreviousRolls(List<List<Die>> previousRolls) {
    _previousRolls = previousRolls;
    notifyListeners();
  }

  void addToPreviousRolls(List<Die> roll) {
    _previousRolls.insert(0, roll);
    notifyListeners();
  }

  void resetPreviousRolls() {
    _previousRolls = [];
    notifyListeners();
  }

  void resetScores() {
    _redPlayerScore = 0;
    _bluePlayerScore = 0;
    _runningTotal = 0;
    _rollTotal = 0;
    notifyListeners();
  }

  void resetAllValues() {
    _scoreToWin = 4000;
    _redPlayerScore = 0;
    _bluePlayerScore = 0;
    _currentPlayer = Player.none;
    _runningTotal = 0;
    _rollTotal = 0;
    _runningDice = [];
    _previousRolls = [];
    notifyListeners();
  }
}
