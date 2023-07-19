import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  const Clickable({required this.onPressed, required this.child, Key? key})
      : super(key: key);

  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: () => onPressed(), child: child),
    );
  }
}
