import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SkillsTile extends StatefulWidget {
  const SkillsTile({
    super.key,
  });

  @override
  State<SkillsTile> createState() => _SkillsTileState();
}

class _SkillsTileState extends State<SkillsTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onEnter: (eve) {
        isHover = true;
        setState(() {});
      },
      onExit: (eve) {
        isHover = false;
        setState(() {});
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: !isHover
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/skills.png'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Skills'),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.all(16),
                  child: FittedBox(
                    child: Column(
                      children: [
                        SkillTile(
                          image: 'assets/images/dart.png',
                          skill: 'Dart',
                        ),
                        SkillTile(
                          image: 'assets/images/flutter.png',
                          skill: 'Flutter',
                        ),
                        SkillTile(
                          image: 'assets/images/state.png',
                          skill:
                              'Provider/Bloc/\nRiverpod/Getx\nState Management',
                        ),
                        SkillTile(
                          image: 'assets/images/restapi.png',
                          skill: 'REST API',
                        ),
                        SkillTile(
                          image: 'assets/images/clean.png',
                          skill: 'Clean Architecture',
                        ),
                        SkillTile(
                          image: 'assets/images/firebase.png',
                          skill: 'Firebase',
                        ),
                        SkillTile(
                          image: 'assets/images/maps.png',
                          skill: 'Google Maps',
                        ),
                        SkillTile(
                          image: 'assets/images/stripe.png',
                          skill: 'Stripe',
                        ),
                        SkillTile(
                          image: 'assets/images/revenuecat.png',
                          skill: 'RevenueCat',
                        ),

                        SkillTile(
                          image: 'assets/images/animation.png',
                          skill: 'Animations',
                        ),
                        SkillTile(
                          image: 'assets/images/figma.png',
                          skill: 'Figma',
                        ),
                        // SkillTile(
                        //   image: 'assets/images/html.png',
                        //   skill: 'HTML',
                        // ),
                        // SkillTile(
                        //   image: 'assets/images/css.png',
                        //   skill: 'CSS',
                        // ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class SkillTile extends StatelessWidget {
  const SkillTile({
    required this.image,
    required this.skill,
    super.key,
  });

  final String image;
  final String skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          // width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                child: Image.asset(image),
              ),
              const SizedBox(
                width: 8,
              ),
              AnimatedTextKit(
                  displayFullTextOnTap: true,
                  onTap: () {},
                  totalRepeatCount: 1,
                  animatedTexts: [
                    // TypewriterAnimatedText(skill),
                    TyperAnimatedText(skill),
                  ]),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
