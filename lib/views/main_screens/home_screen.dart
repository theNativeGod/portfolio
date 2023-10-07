import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'intro_screen.dart';
import 'portfolio_screen.dart';
import 'scroll_helper_screen.dart';
import 'widgets/cursor_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _macScrollController = ScrollController();
  var portfolioKey = GlobalKey();
  var mediaQuery;
  Offset pointer = const Offset(0, 0);
  @override
  void initState() {
    document.documentElement!.requestFullscreen();

    super.initState();
  }

  ScrollController masterController = ScrollController();
  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
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
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                body: Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 10,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.deepPurpleAccent,
                        ),
                      )
                    ],
                  ),
                ),
                ScrollingWidget(
                    size: size,
                    macScrollController: _macScrollController,
                    portfolioKey: portfolioKey),
              ],
            )),
          ),
          CursorWidget(pointer: pointer),
        ],
      ),
    );
  }
}

class ScrollingWidget extends StatefulWidget {
  const ScrollingWidget({
    super.key,
    required this.size,
    required ScrollController macScrollController,
    required this.portfolioKey,
  }) : _macScrollController = macScrollController;

  final Size size;
  final ScrollController _macScrollController;
  final GlobalKey<State<StatefulWidget>> portfolioKey;

  @override
  State<ScrollingWidget> createState() => _ScrollingWidgetState();
}

class _ScrollingWidgetState extends State<ScrollingWidget> {
  bool isVisited = false;
  RenderObject? _prevRenderObject;
  double _offsetToRevealBottom = double.infinity;
  double _offsetToRevealTop = double.negativeInfinity;

  @override
  Widget build(BuildContext context) {
    return ScrollTransformView(
      children: [
        ScrollTransformItem(
          builder: (scrollOffset) {
            final offScreenPercentage =
                min(scrollOffset / widget.size.height, 1.0);

            return SizedBox(
              height: widget.size.height * (1 - .2 * offScreenPercentage),
              width: widget.size.width * (1 - .5 * offScreenPercentage),
              child: IntroScreen(
                  size: widget.size,
                  macScrollController: widget._macScrollController,
                  portfolioKey: widget.portfolioKey),
            );
          },
          offsetBuilder: (scrollOffset) {
            final offScreenPercentage =
                min(scrollOffset / widget.size.height, 1.0);
            final heightShrinkageAmount =
                widget.size.height * .2 * offScreenPercentage;

            final bool startMoving = scrollOffset >= widget.size.height;
            final onScreenOffset = scrollOffset + heightShrinkageAmount / 2;
            return Offset(
              0,
              !startMoving
                  ? onScreenOffset
                  : onScreenOffset - (scrollOffset - widget.size.height),
            );
          },
        ),
        ScrollTransformItem(builder: (scrollOffset) {
          return Container(
            height: widget.size.height,
            child: ScrollHelperScreen(),
          );
        }),
        ScrollTransformItem(
            key: widget.portfolioKey,
            builder: (scrollOffset) {
              return PortfolioScreen(size: widget.size);
            }),
      ],
    );
  }
}

class PortfolioTile extends StatefulWidget {
  const PortfolioTile({
    super.key,
  });

  @override
  State<PortfolioTile> createState() => _PortfolioTileState();
}

class _PortfolioTileState extends State<PortfolioTile> {
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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 100,
        color: Colors.deepPurpleAccent,
        alignment: Alignment.center,
        child: isHover
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(0),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'View Portfolio',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/portfolio.png'),
                  SizedBox(
                    height: 16,
                  ),
                  const Text('Portfolio'),
                ],
              ),
      ),
    );
  }
}

class Social extends StatelessWidget {
  const Social({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialIcon('linkedIn'),
        SizedBox(
          width: 16,
        ),
        SocialIcon('git'),
      ],
    );
  }
}

class SocialIcon extends StatefulWidget {
  const SocialIcon(
    this.icon, {
    super.key,
  });

  final String icon;

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon>
    with SingleTickerProviderStateMixin {
  bool isHover = false;
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onEnter: (eve) {
        _animationController!.forward();
        // setState(() {});
      },
      onExit: (eve) {
        _animationController!.reverse();
        // setState(() {});
      },
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: _animation!.value * 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.white54,
                    width: 1,
                  ),

                  gradient: const LinearGradient(
                    colors: [
                      Colors.white54,
                      Colors.white10,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                  ),

                  // color: Colors.deepPurpleAccent,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/images/${widget.icon}.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
