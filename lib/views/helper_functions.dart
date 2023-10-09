import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchHelper(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

void navigateTo(BuildContext context, Widget screen) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (ctx) => screen),
  );
}

void replaceTo(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (ctx) => screen),
  );
}
