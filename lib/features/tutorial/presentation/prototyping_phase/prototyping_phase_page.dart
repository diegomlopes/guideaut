import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
              "Prototyping Phase",
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
                        text: ""
                            'Prototyping this is the step in which the 1st version of the prototype should effectively be developed. To do so, the development team (designers/developers) must adopt the interactions and requirements contained in the lists of requirements/restrictions. In addition to the elements contained in this list, the team can also consult GuideAut for any suggestions on some characteristics to be observed in relation to the elements. For example, regarding colors and geometric shapes. The result of this step consists of a prototype to be evaluated in the next step.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Suggested Procedures:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Make the prototype based mainly on 6 and 7 (main interface elements and complementary interface elements respectively).'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'After manufacturing, the prototype is evaluated. To do so, the team will be able to use techniques already consolidated in the area of Software Engineering. However, it suggests some items to be observed regarding the user. For example, check who will be the main application user. Whether the specialist will be the parents or the autistic. Depending on who will be the main user, traditional techniques must be observed for each type of user. If you are autistic, search, for example, on GuideAut for some suggestions for carrying out the assessment.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Ao final desta etapa, a eeuipe deve considerar e avaliar todas as sugestões de melhoria, refinar o protótipo e reavaliar até que esteja em uma versão satisfatória. Em seguida, o protótipo poderá estar disponível para desenvolvimento da aplicação em si.'
                            "",
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
                        "See too:",
                        style: imageHomeSubTitleTextStyle,
                      ),
                      FullCard(
                        text: "Immersion Phase",
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.imersionPhasePage),
                      ),
                      FullCard(
                        text: "Analysis Phase",
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.analysisPhasePage),
                      ),
                      FullCard(
                        text: "Ideation Phase",
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
    ;
  }
}
