import 'package:flutter/material.dart';
import 'package:portfolio/views/helper_functions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../project_details_screen.dart';
import 'headings.dart';

class Links extends StatefulWidget {
  const Links({
    this.playStoreLink,
    this.appStoreLink,
    super.key,
  });

  final String? appStoreLink;
  final String? playStoreLink;

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeadingWidget(heading: 'Links'),
        SizedBox(
          height: 8,
        ),
        TextButton(
          onPressed: () {
            launchHelper(widget.playStoreLink!);
          },
          child: Text('PlayStore'),
        ),
        SizedBox(
          height: 8,
        ),
        TextButton(
          onPressed: () {
            launchHelper(widget.appStoreLink!);
          },
          child: Text('AppStore'),
        ),
      ],
    );
  }
}
