import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  const StarRating({
    Key? key,
    required this.rating,
    required this.onRating,
  }) : super(key: key);

  final int rating;
  final Function(int) onRating;

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;
  @override
  void initState() {
    super.initState();

    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildStar(1),
        buildStar(2),
        buildStar(3),
        buildStar(4),
        buildStar(5),
      ],
    );
  }

  Widget buildStar(int starCount) {
    return InkWell(
      onTap: () {
        setState(() {
          _rating = starCount;
        });
        widget.onRating(starCount);
      },
      child: Icon(
        _rating >= starCount ? Icons.star : Icons.star_border,
        color: Colors.yellow,
      ),
    );
  }
}
