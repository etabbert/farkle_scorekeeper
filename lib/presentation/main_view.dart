import 'package:farkle_scorekeeper/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PageService>(
      builder: (context, pageService, child) {
        return PageView.builder(
            controller: pageService.pageController,
            allowImplicitScrolling: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return pageService.pages[index].page;
            });
      },
    );
  }
}
