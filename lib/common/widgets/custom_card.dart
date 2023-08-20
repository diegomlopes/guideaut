import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:responsive_ui/responsive_ui.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.icon,
    this.color,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onPressed: () => onPressed(),
      child: Div(
        divison: const Division(colS: 12, colM: 6, colL: 3),
        child: Card(
          color: color ?? Colors.blue[700],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        size: 50,
                        color: Colors.white,
                      )
                    : Container(),
                Text(text,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        // letterSpacing: 1,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
