import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/clickable.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.imagePath,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () => onPressed(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                imagePath,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
