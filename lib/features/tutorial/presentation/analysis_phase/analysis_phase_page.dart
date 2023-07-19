import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/common/widgets/image_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
              "Analysis Phase",
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
                            'The Analysis phase is characterized by approaching the problem, in which the team dives into all the information obtained in the previous phase, evaluates the implications of the challenge from the point of view of the various stakeholders, and initiates the main solution proposals.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'It is basically composed of 3 activities: Triangular Data, Generate Empathy Map and Generate Personas. Emphasizing that the last two have the same objective, which is the generation of empathy between the designer and the autistic. However, in ProAut, the designer can choose the one that most identifies with him or both, if he prefers, since they are generally used in a complementary way. Figure 12 presents the overview of this phase.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Inputs: the Caregivers, Therapist and Requester Canvas; the completed FCA\'s and their respective Autistic Overview Charts (VGA);'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Outputs (artifacts): Initial List of Requirements/Constraints, Personas, Empathy Map;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Activities: Triangular Data; Generate Empathy Map (EmpathyAut); Generate Personas (PersonAut);'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Involveds: Designers/Developers'
                            "",
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
                        text: ""
                            'Details of the Analysis Phase Activities'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Triangular Data'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'In this activity, you must use the multiple sources of data (the different Canvas) generated in the immersion phase, and perform an analysis of the compatible sections in order to design an initial list of requirements/restrictions (figure below). Such a list is obtained not only by what the requester himself wants, but also by crossing information contained in the Canvas of parents and specialists.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'In addition, the name initial list is due to the fact that in this phase only the first 4 columns are filled in (the rest will be filled in in the next step). The content of the Requirement Items column must contain the details of each requirement identified in the Requirement column. That is, a requirement can give rise to multiple requirement items. As for the ID column, this must represent the unique identification of the requirement, starting with the letters RQ to represent a requirement, and RT for a restriction followed by a sequential number (which can be two digits. Example: RQ01 for requirement 1, and RT01 for constraint 01. The column RQ can be filled with the value RQ for requirement and RT for constraint.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Below is a suggestion for conducting the analysis of the data contained in the Canvas sections, in order to generate the initial list of requirements/restrictions:'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Procedure Suggestion:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. Analyze sections 5 (Recommended Activities in relation to the topic), 6 (Restrictive Activities in relation to the software), and 7c (Notes regarding the Sw/App) of the CTA (Specilist);\n'
                            '2. Review sections 4(Indicated Activities), 5(Non-Indicated Activities) and 7 (Requirements) of the CSS (Applicant).'
                            "",
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
                        text: ""
                            'Generate Personas'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'In this activity, personas (PersonAut) must be generated that will be objects of empathy generation in the next phase (ideation). Each persona must correspond to an FCA. ProAut has 2 templates for Personas. Figure 14 shows an instantiated example of Model 1.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Procedure for Model 1:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. From the Canvases of Parents and Experts, transcribe the sections Activities that Calm Down, Stereotypies/Manias and Activities that Stress respectively to the sections Activities that Calm Down, Stereotypies/Manias and Activities that Stress in PersonAut;\n'
                            '2. For Parent Canvas only, transcribe the Social and Family Aspects section to the section of the same name in the Persona Template;\n'
                            '3. If there are conflicting instances, that is, instances of different sections in the Parents and Experts Canvases with the same value (for example a certain activity belongs to the Stressful Activities section in a canvas, and this same activity appears with the calming activity in the other), one must analyze and choose one of them to compose the respective section of PersonAut;\n'
                            '4. In the PersonAut Demographic Characteristics section do the following:\n'
                            '5. “Name” field: Give a fictitious name for the persona;\n'
                            '6. “Age” field: choose an age within the age range defined in the profile section of the Parents or Experts Canvas; It is\n'
                            '7. “Genre” field: define a Genre\n'
                            '8. In the General Characteristics section of the Persona Canvas, do the following:\n'
                            '9. In the field “Language:” enter one of the following options: verbal, non-verbal, echolalic verbal\n'
                            '10. “Sensitivity to Sound” field: Enter according to the response to one of items 28 and 29 of the FCA (28- Exaggerated reaction to auditory stimuli; 29- Hypo-reaction to auditory stimuli). That is, the one that is marked as 1.\n'
                            '11. Field “Level of Autism” – enter as defined in the Profile section of the APC (mild, moderate or severe).\n'
                            '12. Insert the VGA graphic generated by the electronic FCA.\n'
                            '13. Finally, insert a fictitious photo or a face drawing to compose the Persona image.'
                            "",
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
                        text: ""
                            'Generate Empathy Map'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'In this activity, another empathy object must also be generated for the ideation phase, which corresponds to an Empathy Map, called EmpathyAut (see Figure 16). EmpathyAut instances are obtained directly from the FCA and from the Requester Canvas (ASRC- Autistic\'s Software Requester Canvas).'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Procedure Suggestion:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. Give the persona a fictitious name;\n'
                            '2. Enter an age between the age range defined in the ARC profile;\n'
                            '3. Transcribe each characteristic marked with the value 1 in the AFC, to the corresponding category (of the same name) of EmpathyAut.\n'
                            '4. Transcribe the Sound/Noise Sensitivity Level section of EmpathyAut to be instantiated from one of the FCA characteristics 28 and 29 responses (28- Exaggerated reaction to auditory stimuli; 29- Hypo-reaction to auditory stimuli). FCA Behavior category; of one of the items That is, the one marked as 1.\n'
                            '5. Instances of the “Purpose of the Software” section together with the “Public Needs in relation to the topic” section of the ASRC shall compose the “Needs” section; It is\n'
                            '6. Finally, instances of the “Skills to be developed” section must be transcribed for the “Motivations” section.'
                            "",
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
                        text: ""
                            'VGA graphics generation'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'If the FCA has been used in printed form, the responses obtained in the electronic FCA must be transcribed. With this, the VGA graph is automatically generated from filling the FCA in electronic form.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Procedure Suggestion:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. If the designer/developer has opted for a single FCA, this will also generate a single VGA;\n'
                            '2. If the designer/developer has chosen several FCAs, then each one must be transcribed into electronic form and, consequently, generate 1 VGA for each FCA.'
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
                        text: "Ideation Phase",
                        textStyle: textLinkStyle,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.ideationPhasePage),
                      ),
                      FullCard(
                        text: "Protyping Phase",
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
    ;
  }
}
