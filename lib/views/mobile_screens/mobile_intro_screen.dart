import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MobileIntroScreen extends StatelessWidget {
  const MobileIntroScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/beach.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const FittedBox(
                  child: Text(
                    'Saswata Saha',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
          ),
          Flexible(
            flex: 8,
            child: Align(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                stopPauseOnTap: true,
                repeatForever: false,
                displayFullTextOnTap: true,
                onTap: () {},
                animatedTexts: [
                  TypewriterAnimatedText(
                    // speed: const Duration(milliseconds: 50),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                    'Hi, I\'m Saswata, a Flutter developer who loves making cool mobile apps. I\'m all about making your app ideas come true. I pay close attention to details, finish on time, and support you even after the app is live. I\'m super excited to work with you and create awesome apps together!',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
