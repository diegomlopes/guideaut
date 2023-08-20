import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/common/widgets/image_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalysisPhasePage extends StatefulWidget {
  const AnalysisPhasePage({Key? key}) : super(key: key);

  @override
  State<AnalysisPhasePage> createState() => _AnalysisPhasePageState();
}

class _AnalysisPhasePageState extends State<AnalysisPhasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Text(
              AppLocalizations.of(context)!.analysis_phase,
              style: imageHomeTitleTextStyle,
            ),
            Responsive(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Div(
                  divison:
                      const Division(colS: 12, colM: 12, colL: 10, colXL: 10),
                  child: Column(
                    children: [
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis1,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis2,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis3,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis4,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis5,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis6,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/analysis_phase_overview.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis7,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis8,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis9,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis10,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis11,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis12,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis13,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/analysis_phase_requisits.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis14,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis15,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis16,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis17,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/analysis_phase_personaut.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis18,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis19,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis20,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis21,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/analysis_phase_canvas_empathyaut.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis22,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis23,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis24,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.analysis25,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Div(
                  divison:
                      const Division(colS: 12, colM: 12, colL: 10, colXL: 10),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.see_to,
                        style: imageHomeSubTitleTextStyle,
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion_phase,
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.imersionPhasePage),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation_phase,
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.ideationPhasePage),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.prototyping_phase,
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.prototypingPhasePage),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
