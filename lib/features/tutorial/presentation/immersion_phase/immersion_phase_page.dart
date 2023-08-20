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

class ImmersionPhasePage extends StatefulWidget {
  const ImmersionPhasePage({Key? key}) : super(key: key);

  @override
  State<ImmersionPhasePage> createState() => _ImmersionPhasePageState();
}

class _ImmersionPhasePageState extends State<ImmersionPhasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Text(
              AppLocalizations.of(context)!.immersion_phase,
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
                        text: AppLocalizations.of(context)!.immersion,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion1,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath: "assets/images/immersion_phase.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion2,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath: "assets/images/immersion_phase_steps.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion3,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion4,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion5,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_learn_context.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion6,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion7,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion8,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion9,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_example_register.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion10,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion11,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_elicit_requisits.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion12,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion13,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion14,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_interview.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion15,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_interview_caregivers.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion16,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_interview_therapist.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion17,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion18,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion19,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion20,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion21,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_autistic_view.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion22,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion23,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion24,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion25,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion26,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion27,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion28,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion29,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion30,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion31,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_consolidate_data.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion32,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion33,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion34,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion35,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_client_canvas.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion36,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion37,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion38,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion39,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion40,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion41,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion42,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion43,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion44,
                        onPressed: () {},
                      ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_caregivers_canvas.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion45,
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion46,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion47,
                        onPressed: () {},
                      ),
                      // FullCard(
                      //   text: AppLocalizations.of(context)!.immersion48,
                      //   onPressed: () {},
                      // ),
                      // FullCard(
                      //   text: ""
                      //       'Question 2: State the type of communication: verbal, non-verbal or echolalic verbal.'
                      //       "",
                      //   onPressed: () {},
                      // ),
                      Div(
                        divison:
                            const Division(colS: 6, colM: 6, colL: 5, colXL: 5),
                        child: ImageCard(
                          imagePath:
                              "assets/images/immersion_phase_therapist_canvas.png",
                          onPressed: () {},
                        ),
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion48,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: AppLocalizations.of(context)!.immersion49,
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
