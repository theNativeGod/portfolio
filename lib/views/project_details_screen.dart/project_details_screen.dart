import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        // padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.blueGrey,
              // height: 400,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Image.asset('assets/images/toyaDetails.png'),
            ),
            const Text('Toya', ),
          ],
        ),
      ),
    );
  }
}
