import 'package:flutter/material.dart';
import 'package:footer/footer.dart' as footer;
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:responsive_ui/responsive_ui.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 400,
      child: footer.Footer(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Responsive(children: [
                Div(
                    divison: const Division(colS: 12, colM: 6, colL: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.home),
                            child: Text(
                              'HOME',
                              style: imageHomeTextStyle,
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.tutorial),
                            child: Text(
                              'PROAUT',
                              style: imageHomeTextStyle,
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.tools),
                            child: Text(
                              'TOOLS',
                              style: imageHomeTextStyle,
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.about),
                            child: Text(
                              'ABOUT',
                              style: imageHomeTextStyle,
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.contact),
                            child: Text(
                              'CONTACT',
                              style: imageHomeTextStyle,
                            ),
                          ),
                        ],
                      ),
                    )),
                Div(
                    divison: const Division(colS: 12, colM: 6, colL: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Universidade do Estado do Amazonas',
                            style: imageHomeTextStyle,
                          ),
                          Text(
                            'Escola Superior de Tecnologia',
                            style: imageHomeTextStyle,
                          ),
                          Text(
                            'Av. Darcy Vargas, 1.200',
                            style: imageHomeTextStyle,
                          ),
                          Text(
                            'Parque Dez de Novembro',
                            style: imageHomeTextStyle,
                          ),
                          Text(
                            'Manaus - AM',
                            style: imageHomeTextStyle,
                          ),
                          Text(
                            '69050-020',
                            style: imageHomeTextStyle,
                          ),
                          Text(
                            '(92) 3348-7601',
                            style: imageHomeTextStyle,
                          ),
                        ],
                      ),
                    )),
                Div(
                    divison: const Division(colS: 12, colM: 6, colL: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/app_icon_white.png",
                              height: 40,
                            ),
                          ),
                          Text('GUIDEAUT',
                              style: GoogleFonts.montserrat(
                                color: textPrimary,
                                fontSize: 30,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    )),
              ]),
              Text(
                'Copyright ©2022, All Rights Reserved.',
                style: imageHomeTextStyle,
              ),
            ]),
      ),
    );
  }
}
