import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class HeroTile extends StatelessWidget {
  const HeroTile({
    super.key,
    required this.size,
    required ScrollController macScrollController,
  }) : _macScrollController = macScrollController;

  final Size size;
  final ScrollController _macScrollController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/beach.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 140,
            vertical: 120,
          ),
          alignment: const AlignmentDirectional(0, .1),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/mac.png',
                fit: BoxFit.fill,
              ),
              //Container(color: Colors.purple),
              Positioned.fill(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * .08, vertical: 20),
                  //color: Colors.deepPurpleAccent,
                  alignment: const AlignmentDirectional(0, 0),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: NotificationListener<ScrollMetricsNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.extentAfter > 12) {
                          _macScrollController.animateTo(
                            _macScrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                        return true;
                      },
                      child: SingleChildScrollView(
                        controller: _macScrollController,
                        physics: const BouncingScrollPhysics(),
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          stopPauseOnTap: true,
                          repeatForever: false,
                          displayFullTextOnTap: true,
                          onTap: () {},
                          animatedTexts: [
                            TypewriterAnimatedText(
                              // speed: const Duration(milliseconds: 50),
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                              'Hi, I\'m Saswata, a Flutter developer who loves making cool mobile apps. I\'m all about making your app ideas come true. I pay close attention to details, finish on time, and support you even after the app is live. I\'m super excited to work with you and create awesome apps together!',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.black12,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    'Saswata Saha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Social(),
            ],
          ),
        )
      ],
    );
  }
}
