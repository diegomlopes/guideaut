import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/common/widgets/image_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
              "The ProAut",
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
                            'ProAut is a process designed to support Application Interface '
                            'projects for autistic people. Its focus is mainly lay designers '
                            'and/or developers'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'ProAut is responsible for 4 Steps (as shown below) motivated '
                            'by Design Thinking: Immersion, Analysis, Ideation and '
                            'Prototyping;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Each stage has activities and generates a set of sanitary '
                            'valves that serve as inputs for the subsequent stage;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'ProAut does not claim to support interface design per se. '
                            'Its stages and respective activities are exclusively '
                            'proposed to assist in conducting the process of creating '
                            'interfaces, providing techniques for carrying out these '
                            'activities, in order to provide, for example, the understanding '
                            'of the autism theme (desk research), the survey of requirements '
                            '(interviews), the generation of empathy with autistic people '
                            '(PersonAut and EmpathyAut), as well as the details of the '
                            'scenarios that will allow the design of the interface '
                            '(list of requirements and scenarios).'
                            "",
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
                    text: "Immersion Phase",
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.imersionPhasePage),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.auto_stories,
                    alignment: CrossAxisAlignment.center,
                    text: "Analysis Phase",
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.analysisPhasePage),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.auto_stories,
                    alignment: CrossAxisAlignment.center,
                    text: "Ideation Phase",
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.ideationPhasePage),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 6, colL: 5, colXL: 5),
                  child: FullCard(
                    icon: Icons.auto_stories,
                    alignment: CrossAxisAlignment.center,
                    text: "Prototyping Phase",
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
