import 'dart:html';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/text.dart';
import 'package:portfolio/view_models/frame_provider.dart';
import 'package:portfolio/view_models/visibility_provider.dart';
import 'package:portfolio/views/main_screens/home_screen.dart';
import 'package:portfolio/views/mobile_screens/mobile_home.dart';
import 'package:portfolio/views/project_details_screen.dart/project_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    window.addEventListener(
        'resize',
        (event) => {
              setState(
                () {},
              )
            });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => VisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FrameProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: ThemeData(
          fontFamily: 'OdudoMono',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: window.innerWidth! < 700 ? MobileHome() : HomeScreen(),
      ),
    );
  }
}
