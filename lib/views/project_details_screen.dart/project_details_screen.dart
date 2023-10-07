import 'package:flutter/material.dart';
import 'package:portfolio/views/main_screens/widgets/cursor_widget.dart';
import 'package:portfolio/views/project_details_screen.dart/widgets/project_sterling.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/project_toya.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen(this.i, {super.key});
  final int i;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
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
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 16),
              child: widget.i == 0 ? ProjectToya() : ProjectSterling(),
            ),
          ),
          CursorWidget(pointer: pointer),
        ],
      ),
    );
  }
}
