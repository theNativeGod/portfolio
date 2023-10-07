import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view_models/visibility_provider.dart';
import 'package:portfolio/views/project_details_screen.dart/project_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    var visibilityProvider = Provider.of<VisibilityProvider>(context);
    return VisibilityDetector(
      key: Key('Portfolio'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          if (!visibilityProvider.hasVisited && !visibilityProvider.triggered) {
            print(visibilityProvider.triggered);
            visibilityProvider.triggered = true;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  width: size.width * .4,
                  backgroundColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(days: 1),
                  action: SnackBarAction(
                    label: 'Got it',
                    onPressed: () {
                      visibilityProvider.hasVisited = true;
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                  content: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: AnimatedTextKit(
                      repeatForever: false,
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          speed: const Duration(
                            milliseconds: 50,
                          ),
                          'Hi!, This is my portfolio section, where you can find some of my best works. Click on the tiles to know more about the projects. Also this webapp itself is made in Flutter. Have fun :)',
                        )
                      ],
                    ),
                  )),
            );
          }
        } else {
          visibilityProvider.triggered = false;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      child: Container(
        height: size.height,
        color: Colors.deepPurpleAccent,
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              mainAxisExtent: size.height - 8,
              maxCrossAxisExtent: size.width / 2,
            ),
            itemCount: 2,
            itemBuilder: (ctx, i) {
              return ProjectTile(
                size: size,
                i: i,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProjectTile extends StatefulWidget {
  const ProjectTile({
    super.key,
    required this.size,
    required this.i,
  });

  final Size size;
  final int i;

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _animation = Tween(end: 1.0, begin: 0.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (eve) {
        _animationController!.forward();
      },
      onExit: (eve) {
        _animationController!.reverse();
      },
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              width: widget.size.width / 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/app${widget.i + 1}.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProjectDetailsScreen(),
                ),
              );
            },
            child: Container(
              height: (widget.size.height - 8) * _animation!.value,
              width: widget.size.width / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black38,
                    Colors.black54,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: const Text(
                  'Open Project',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
