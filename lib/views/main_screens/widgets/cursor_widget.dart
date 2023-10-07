import 'package:flutter/material.dart';

class CursorWidget extends StatelessWidget {
  const CursorWidget({
    super.key,
    required this.pointer,
  });

  final Offset pointer;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(microseconds: 300),
      left: pointer.dx - 20,
      top: pointer.dy - 20,
      child: IgnorePointer(
        //   behavior: HitTestBehavior.translucent,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              width: 2,
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
          ),
          alignment: Alignment.center,
          child: CircleAvatar(radius: 2, backgroundColor: Colors.grey),
        ),
      ),
    );
  }
}
