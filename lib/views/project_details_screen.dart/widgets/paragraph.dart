import 'package:flutter/material.dart';

import '../project_details_screen.dart';
import 'headings.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({
    required this.heading,
    required this.text,
    super.key,
  });

  final String heading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeadingWidget(heading: heading),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
