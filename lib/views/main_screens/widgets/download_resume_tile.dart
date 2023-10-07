import 'package:flutter/material.dart';
import 'package:portfolio/views/helper_functions.dart';

class DownlaodResumeTile extends StatefulWidget {
  const DownlaodResumeTile({
    super.key,
  });

  @override
  State<DownlaodResumeTile> createState() => _DownlaodResumeTileState();
}

class _DownlaodResumeTileState extends State<DownlaodResumeTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onEnter: (value) {
        isHover = true;
        setState(() {});
      },
      onExit: (value) {
        isHover = false;
        setState(() {});
      },
      child: InkWell(
        onTap: () {
          launchHelper(
              '');
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: .1,
              color: Colors.black,
            ),
          ),
          alignment: Alignment.center,
          child: isHover
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'View Resume',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/pdf.png'),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text('Resume'),
                  ],
                ),
        ),
      ),
    );
  }
}
