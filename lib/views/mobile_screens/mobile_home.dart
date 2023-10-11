import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view_models/mobile_screen_provider.dart';
import 'package:portfolio/views/helper_functions.dart';
import 'package:portfolio/views/main_screens/home_screen.dart';
import 'package:portfolio/views/main_screens/widgets/skills_tile.dart';
import 'package:portfolio/views/mobile_screens/mobile_skills.dart';
import 'package:provider/provider.dart';

import '../main_screens/widgets/cursor_widget.dart';
import 'app_drawer.dart';
import 'mobile_intro_screen.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Offset pointer = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    var screenProvider = Provider.of<MobileScreenProvider>(context);
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
            endDrawer: AppDrawer(screenProvider: screenProvider),
            body: screenProvider.screen == 0
                ? const MobileIntroScreen()
                : Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: SizedBox(
                              // width: MediaQuery.of(context).size.width * .5,
                              child: const FittedBox(
                                child: Text(
                                  'Skills',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            iconTheme: const IconThemeData(color: Colors.black),
                          ),
                        ),
                        Flexible(
                          flex: 8,
                          child: MobileSkills(),
                        )
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
