import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/theme/theme.dart';

class FullCard extends StatelessWidget {
  const FullCard({
    this.icon,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.alignment = CrossAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  final TextStyle? textStyle;
  final Function onPressed;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () => onPressed(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              icon != null ? Icon(icon, size: 50) : Container(),
              Text(
                text,
                style: textStyle ?? imageHomeTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
