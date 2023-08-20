import 'package:flutter/material.dart';
import 'package:footer/footer.dart' as footer;
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 400,
      child: footer.Footer(
        backgroundColor: Colors.blue[700],
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
                              AppLocalizations.of(context)!.home,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  // letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.tutorial),
                            child: Text(AppLocalizations.of(context)!.proaut,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    // letterSpacing: 1,
                                  ),
                                )),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.tools),
                            child: Text(
                              AppLocalizations.of(context)!.tools,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  // letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.about),
                            child: Text(
                              AppLocalizations.of(context)!.about,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  // letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          Clickable(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.contact),
                            child: Text(AppLocalizations.of(context)!.contact,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    // letterSpacing: 1,
                                  ),
                                )),
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
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            'Escola Superior de Tecnologia',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text('Av. Darcy Vargas, 1.200',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  // letterSpacing: 1,
                                ),
                              )),
                          Text(
                            'Parque Dez de Novembro',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            'Manaus - AM',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            '69050-020',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            '(92) 3348-7601',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                // letterSpacing: 1,
                              ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/app_icon_white.png",
                              height: 40,
                            ),
                          ),
                          Text('GUIDEAUT',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
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
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    // letterSpacing: 1,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
