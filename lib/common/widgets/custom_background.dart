import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:responsive_ui/responsive_ui.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () => onPressed(),
      child: Div(
        divison: const Division(colS: 12, colM: 6, colL: 3),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
