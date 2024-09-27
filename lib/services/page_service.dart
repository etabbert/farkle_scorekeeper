import 'package:farkle_scorekeeper/models/custom_page.dart';
import 'package:farkle_scorekeeper/presentation/pages/home_page.dart';
import 'package:farkle_scorekeeper/presentation/pages/scoreboard_page.dart';
import 'package:farkle_scorekeeper/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class PageService extends ChangeNotifier {
  final PageController pageController;

  PageService({required this.pageController});

  List<CustomPage> pages = [
    CustomPage(name: 'HomePage', page: const HomePage()),
    CustomPage(name: "ScoreboardPage", page: const ScoreboardPage()),
    CustomPage(name: "SettingsPage", page: const SettingsPage()),
  ];

  void goToPageByName(String name) {
    var page = pages.indexWhere((page) => page.name == name);
    pageController.jumpToPage(page);
  }
}
