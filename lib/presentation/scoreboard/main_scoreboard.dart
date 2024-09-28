import 'package:farkle_scorekeeper/custom_theme.dart';
import 'package:farkle_scorekeeper/services/scorekeeper_service.dart';
import 'package:farkle_scorekeeper/utils/shape_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScoreboard extends StatelessWidget {
  const MainScoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScorekeeperService>(
        builder: (context, scoreKeeperService, child) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final double fullHeight = constraints.maxHeight;
          final double fullWidth = constraints.maxWidth;

          final double heightOffset = fullHeight * 0.1;
          final double scoreWidthOffset = fullWidth / 8;

          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: fullHeight - heightOffset + 5,
                width: fullWidth,
                color: Colors.white,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: fullHeight - heightOffset,
                      color: Colors.blue,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FittedBox(
                              child: Text(
                                  scoreKeeperService.player1Score.toString(),
                                  style: CustomTheme
                                      .themeData.textTheme.displayLarge),
                            ),
                            SizedBox(width: scoreWidthOffset)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: fullHeight - heightOffset,
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(width: scoreWidthOffset),
                            FittedBox(
                              child: Text(
                                  scoreKeeperService.player2Score.toString(),
                                  style: CustomTheme
                                      .themeData.textTheme.displayLarge),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TrapezoidWidget(
                width: fullWidth / 5,
                height: fullHeight,
                cornerRadius: 10,
                borderWidth: 5,
                borderColor: Colors.white,
                fillColor: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${scoreKeeperService.scoreToWin} pts",
                          style: CustomTheme.themeData.textTheme.displayLarge,
                        ),
                        Text(
                          "to WIN",
                          style: CustomTheme.themeData.textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              // ClipPath(
              //   clipper: TrapezoidClipper(),
              //   child: Container(
              //     height: fullHeight,
              //     width: fullWidth / 5,
              //     decoration: BoxDecoration(
              //       color: Colors.amber,
              //       border: Border.all(
              //         color: Colors.white,
              //         width: 2,
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(5.0),
              //       child: FittedBox(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "${scoreKeeperService.scoreToWin} pts",
              //               style: CustomTheme.themeData.textTheme.displayLarge,
              //             ),
              //             Text(
              //               "to WIN",
              //               style:
              //                   CustomTheme.themeData.textTheme.displayMedium,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      );
    });
  }
}
