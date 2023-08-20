import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrototypingPhasePage extends StatefulWidget {
  const PrototypingPhasePage({Key? key}) : super(key: key);

  @override
  State<PrototypingPhasePage> createState() => _PrototypingPhasePageState();
}

class _PrototypingPhasePageState extends State<PrototypingPhasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Text(
              AppLocalizations.of(context)!.prototyping_phase,
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
                        text: AppLocalizations.of(context)!.prototyping1,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.prototyping2,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.prototyping3,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.prototyping4,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.prototyping5,
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
                        text: AppLocalizations.of(context)!.ideation_phase,
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.ideationPhasePage),
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
