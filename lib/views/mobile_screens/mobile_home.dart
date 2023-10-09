import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/views/helper_functions.dart';
import 'package:portfolio/views/main_screens/home_screen.dart';

import '../main_screens/widgets/cursor_widget.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Offset pointer = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (eve) async {
        // await Future.delayed(Duration(milliseconds: 100));
        setState(() {
          pointer = eve.position;
        });
      },
      child: Stack(
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
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
            endDrawer: Drawer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.deepPurple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Home',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        'Skills',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Portfolio',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'About',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/beach.jpg',
                  ),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black38, BlendMode.darken),
                ),
              ),
              padding: const EdgeInsets.all(16),
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
                    textAlign: TextAlign.center,
                    'Hi, I\'m Saswata, a Flutter developer who loves making cool mobile apps. I\'m all about making your app ideas come true. I pay close attention to details, finish on time, and support you even after the app is live. I\'m super excited to work with you and create awesome apps together!',
                  ),
                ],
              ),
            ),
          ),
          CursorWidget(pointer: pointer),
        ],
      ),
    );
  }
}
