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

class IdeationPhasePage extends StatefulWidget {
  const IdeationPhasePage({Key? key}) : super(key: key);

  @override
  State<IdeationPhasePage> createState() => _IdeationPhasePageState();
}

class _IdeationPhasePageState extends State<IdeationPhasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Text(
              AppLocalizations.of(context)!.ideation_phase,
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
                        text: AppLocalizations.of(context)!.ideation1,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation2,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/ideation_phase_overview.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation3,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation4,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation5,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation6,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation7,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation8,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation9,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation10,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation11,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation12,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation13,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation14,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation15,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation16,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation17,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation18,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation19,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation20,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation21,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation22,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath: "assets/images/ideation_phase_trr.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation23,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation24,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.ideation25,
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
                        text: AppLocalizations.of(context)!.analysis_phase,
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.analysisPhasePage),
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
