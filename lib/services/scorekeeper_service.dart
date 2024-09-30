import 'package:farkle_scorekeeper/models/dice_roll_item.dart';
import 'package:farkle_scorekeeper/models/die.dart';
import 'package:farkle_scorekeeper/models/list_item.dart';
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
  List<ListItem> _historyItems = [];

  final RegulationService _regulationService = RegulationService();

  int get scoreToWin => _scoreToWin;
  int get redPlayerScore => _redPlayerScore;
  int get bluePlayerScore => _bluePlayerScore;
  Player get currentPlayer => _currentPlayer;
  int get runningTotal => _runningTotal;
  int get rollTotal => _rollTotal;
  List<Die> get runningDice => _runningDice;
  List<ListItem> get historyItems => _historyItems;

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

  void commitRunningRoll() {
    if (_currentPlayer == Player.none || _runningDice.isEmpty) {
      return;
    }

    int calculatedScore = _regulationService.calculateScore(_runningDice);

    addNewRollToTurn(calculatedScore);
  }

  void commitRunningTotal() {
    if (_currentPlayer == Player.none) {
      return;
    }

    if (_currentPlayer == Player.red) {
      _redPlayerScore += _runningTotal;
    } else {
      _bluePlayerScore += _runningTotal;
    }

    _runningTotal = 0;
    _rollTotal = 0;
    _runningDice = [];

    switchPlayers();

    notifyListeners();
  }

  void switchPlayers() {
    String playerName = _getPlayerName(_currentPlayer);
    PlayerLabelItem playerLabel = PlayerLabelItem(playerName: playerName);

    _historyItems.insert(0, playerLabel);

    if (_currentPlayer == Player.red) {
      _currentPlayer = Player.blue;
    } else {
      _currentPlayer = Player.red;
    }

    notifyListeners();
  }

  String _getPlayerName(Player player) {
    switch (player) {
      case Player.red:
        return 'Red';
      case Player.blue:
        return 'Blue';
      default:
        return 'Unknown';
    }
  }

  void farkle() {
    if (_currentPlayer == Player.none) {
      return;
    }

    _runningTotal = 0;
    _rollTotal = 0;
    _runningDice = [];

    addToHistoryItems(FarkleItem());

    switchPlayers();
    notifyListeners();
  }

  void setHistoryItems(List<ListItem> historyItems) {
    _historyItems = historyItems;
    notifyListeners();
  }

  void addToHistoryItems(ListItem item) {
    _historyItems.insert(0, item);
    notifyListeners();
  }

  void resetHistoryItems() {
    _historyItems = [];
    notifyListeners();
  }

  void addToRunningTotal(int score) {
    _runningTotal += score;
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
    _historyItems = [];
    notifyListeners();
  }

  void addNewRollToTurn(int score) {
    if (_currentPlayer == Player.none) {
      return;
    }

    DiceRollItem newRoll = DiceRollItem(
      dice: List.from(_runningDice),
      score: score,
    );

    _historyItems.insert(0, newRoll);

    resetRunningDice();
    addToRunningTotal(score);
    notifyListeners();
  }
}
