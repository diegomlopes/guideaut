import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/common/widgets/image_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Text(
              AppLocalizations.of(context)!.the_proaut,
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
                        text: AppLocalizations.of(context)!.tutorial1,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.tutorial2,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.tutorial3,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.tutorial4,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Div(
                  divison:
                      const Division(colS: 12, colM: 12, colL: 10, colXL: 10),
                  child: ImageCard(
                    imagePath: "assets/images/proaut_flow.png",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Responsive(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.auto_stories,
                    alignment: CrossAxisAlignment.center,
                    text: AppLocalizations.of(context)!.immersion_phase,
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.imersionPhasePage),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.analytics,
                    alignment: CrossAxisAlignment.center,
                    text: AppLocalizations.of(context)!.analysis_phase,
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.analysisPhasePage),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.border_color,
                    alignment: CrossAxisAlignment.center,
                    text: AppLocalizations.of(context)!.ideation_phase,
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.ideationPhasePage),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.newspaper,
                    alignment: CrossAxisAlignment.center,
                    text: AppLocalizations.of(context)!.prototyping_phase,
                    onPressed: () => Navigator.pushNamed(
                        context, Routes.prototypingPhasePage),
                  ),
                ),
              ],
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}
