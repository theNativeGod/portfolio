import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'widgets/download_resume_tile.dart';
import 'widgets/hero_tile.dart';
import 'widgets/skills_tile.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key,
    required this.size,
    required ScrollController macScrollController,
    required this.portfolioKey,
  }) : _macScrollController = macScrollController;

  final Size size;
  final ScrollController _macScrollController;
  final GlobalKey portfolioKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: Row(
              children: [
                Flexible(
                  flex: 6,
                  fit: FlexFit.tight,
                  child: HeroTile(
                      size: size, macScrollController: _macScrollController),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Column(
                    children: [
                      const Flexible(
                        flex: 2,
                        child: SkillsTile(),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              Scrollable.ensureVisible(
                                  portfolioKey.currentContext!);
                            },
                            child: PortfolioTile()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: const FittedBox(
                      child: Text(
                          '📱Contact No: +918170997368  ✉️Email: digitalsaswata@gmail.com'),
                    ),
                  ),
                ),
                const Flexible(fit: FlexFit.tight, child: DownlaodResumeTile()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
