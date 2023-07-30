import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuTopBar extends StatelessWidget {
  const MenuTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPhone(MediaQuery.of(context).size.width)
        ? const MenuSanduiche()
        : const MenuBarForDesktop();
  }

  bool isPhone(double size) {
    if (size <= 800) {
      return true;
    } else {
      return false;
    }
  }
}

class MenuSanduiche extends StatefulWidget {
  const MenuSanduiche({Key? key}) : super(key: key);

  @override
  _MenuSanduicheState createState() => _MenuSanduicheState();
}

class _MenuSanduicheState extends State<MenuSanduiche> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(!_isMenuOpen ? Icons.menu : Icons.close),
            onPressed: _toggleMenu,
          ),
        ),
        GestureDetector(
          onTap: _toggleMenu,
          child: !_isMenuOpen
              ? Container()
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: Colors.grey[50],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.home),
                        style: menuButtonStyle,
                        child: Text(
                          AppLocalizations.of(context)!.home,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.tutorial),
                        style: menuButtonStyle,
                        child: Text(
                          AppLocalizations.of(context)!.proaut,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.tools),
                        style: menuButtonStyle,
                        child: Text(
                          AppLocalizations.of(context)!.tools,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.about),
                        style: menuButtonStyle,
                        child: Text(
                          AppLocalizations.of(context)!.about,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.contact),
                        style: menuButtonStyle,
                        child: Text(
                          AppLocalizations.of(context)!.contact,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

class MenuBarForDesktop extends StatelessWidget {
  const MenuBarForDesktop({Key? key}) : super(key: key);

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
                      child: Text(
                        AppLocalizations.of(context)!.home,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.tutorial),
                      style: menuButtonStyle,
                      child: Text(
                        AppLocalizations.of(context)!.proaut,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.tools),
                      style: menuButtonStyle,
                      child: Text(
                        AppLocalizations.of(context)!.tools,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.about),
                      style: menuButtonStyle,
                      child: Text(
                        AppLocalizations.of(context)!.about,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.contact),
                      style: menuButtonStyle,
                      child: Text(
                        AppLocalizations.of(context)!.contact,
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
