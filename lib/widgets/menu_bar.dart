import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';

class MenuTopBar extends StatelessWidget {
  const MenuTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/app_icon_white.png",
                      height: 30,
                    ),
                  ),
                  Text("GUIDEAUT",
                      style: GoogleFonts.montserrat(
                        color: textPrimary,
                        fontSize: 30,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            Flexible(
              child: Container(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.home),
                      style: menuButtonStyle,
                      child: const Text(
                        "HOME",
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.tutorial),
                      style: menuButtonStyle,
                      child: const Text(
                        "PROAUT",
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.tools),
                      style: menuButtonStyle,
                      child: const Text(
                        "TOOLS",
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.about),
                      style: menuButtonStyle,
                      child: const Text(
                        "ABOUT",
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.contact),
                      style: menuButtonStyle,
                      child: const Text(
                        "CONTACT",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}
