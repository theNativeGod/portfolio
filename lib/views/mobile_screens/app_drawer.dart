import 'package:flutter/material.dart';

import '../../view_models/mobile_screen_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.screenProvider,
  });

  final MobileScreenProvider screenProvider;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
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
                onTap: () {
                  screenProvider.screen = 0;
                  Navigator.pop(context);
                },
                child: const Text(
                  'Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  screenProvider.screen = 1;
                  Navigator.pop(context);
                },
                child: const Text(
                  'Skills',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  screenProvider.screen = 2;
                  Navigator.pop(context);
                },
                child: const Text(
                  'Portfolio',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  screenProvider.screen = 3;
                  Navigator.pop(context);
                },
                child: const Text(
                  'About',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
