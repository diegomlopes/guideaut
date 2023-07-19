import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/common/widgets/image_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
              "Ideation Phase",
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
                            'Overview'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Description: This phase aims to generate ideas through creativity stimuli, with the aim of generating solutions for the requirements defined in the Analysis phase, so that they are in accordance with the context and expectations of the software/app user ( see figure below).'
                            "",
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
                        text: ""
                            'Inputs: the Initial List of Requirements/Restrictions, the Empathy Map and the Personas;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Outputs (artifacts): Updated List of Complete Interface Requirements/Scenarios;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Activities: Define Requirement Items/Constraints, Specify Requirement Items, and Generate/Refine Interface Ideas;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Involveds: Applicants, Caregivers, Therapists and Designers/Developers.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Details of the Ideation Phase Activities'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Define Requirements/Restrictions Items'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The objective of this activity is to identify a set of interface interaction scenarios for each listed requirement item. These scenarios represent the specification of how the requirement can be presented in the interface. Considering that ProAut is User-Centered, and makes use of the Participatory approach, it is suggested the use of the brainstorming technique, and that it be carried out with the collaboration of those involved (parents/mothers, specialists and the applicant), in addition to of the designer and developers.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'This activity has 2 sub-activities: Define scenarios and define main and complementary elements of the interface. Below is a suggestion for conducting this activity:'
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
                            '1. Book the brainstorming session, preferably with the designers/developers, applicant, a specialist and at least one parent;\n'
                            '2. Choose a session moderator, who may be a member of the development team (for example, the designer);\n'
                            '3. Book the brainstorming session, preferably with the designers/developers, applicant, a specialist and a parent, at least;\n'
                            '4. Choose a session moderator, who may be a member of the development team (for example, the designer);\n'
                            '5. Define the discussion time for each requirement item or for the session as a whole;\n'
                            '6. Start the session, with the moderator giving a brief explanation of how the session will be conducted, as well as the meaning of more technical terms (requirement, Persona, Empathy Map, brainstorming, among others) that may be necessary for a better understanding of the participants;\n'
                            '7. The moderator must present the initial list of requirements raised/identified in the analysis phase; It is\n'
                            '8. The moderator should present the Personas and Empathy Map (or distribute a copy of the personas and empathy map to each participant) so that everyone has the profile of the future user in mind;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Specify Items Requirements'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'For each requirement item, participants will be able to contribute with suggestions on how the interactions (scenarios) of that requirement will be carried out. For example: In the context of an application to teach spatial notions, the requirement “Show left/right concept”, the following idea may arise for an interaction scenario: Introduce the concept of laterality, having a person in the center of the screen as a reference. Show the words left and right next to the person while the person raises their left and right arm accordingly. earnestly.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Taking care of the mirror vision (left of the screen and the left of those facing the screen, for example). Present a soft voice (persona preference) speaking the words left right. During the brainstorming session, new requirements not identified in the previous phase may arise. If this occurs and the applicant is participating in the brainstorming session, he may be asked to validate the need for the new requirement(s) identified, otherwise he may be asked at another previously scheduled time.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Generate/Refine Interface Ideas'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The objective of this activity is to choose, among the suggested ideas, those that will effectively compose the application. For this purpose, the use of the menu of ideas technique is suggested. It should be noted that, if there is enough time, this activity can be carried out right after the brainstorming session.'
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
                            '1. If it is held right after the brainstorming session, remain with the same moderator as the previous activity, or select another one;\n'
                            '2. The moderator should distribute copies of the menu of ideas (list of ideas);\n'
                            '3. Define the number of ideas to be selected;\n'
                            '4. Depending on the number of ideas, ask each participant to choose a certain number of ideas. This can be agreed between the participants. The greater the number of ideas, the greater the number of choices. For example, if the list has 10 ideas, each participant can be asked to choose up to 4 ideas, but this will depend on the agreement reached between the participants;\n'
                            '5. After the selections, the mediator must list the most voted ideas. In case of a tie, it is suggested to discuss whether the tied ideas should be used, or if only one of them. In the latter case, discuss with the participants the best option for the project.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Another way of conducting the idea menu technique is to list the requirements with the respective scenario ideas suggested on a blackboard, asking each participant to make their choices. For each idea to vote put, for example, the value 1 and at the end compute the total number of votes for each idea and take the most voted (according to what was previously defined by the participants). It is important to emphasize that the scenario ideas must be aligned with the profiles defined by the Personas and/or empathy map. If you prefer, the team can use other techniques (instead of the Ideas Menu).'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Among them is the Positioning Matrix which, in addition to the Personas, also uses guiding criteria, which can be represented by the restrictions identified in the analysis phase. After such analysis and selection, the main and complementary elements of the selected interaction scenarios are defined. These elements correspond to a breakdown of how the elements that make up the scenario must be presented in the interface to be developed. That is, if the description of the selected scenario mentions an object, in this activity you must define the object (as the main one) and the color or shape of the object (as a complementary one).'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'As a result of this activity, the list of interface requirements/scenarios must be completed. To this end, a new “round” of brainstorming is suggested, which could be on the same day as activity 3.2.1 or on another day previously agreed with the participants. Figure 19 presents a complete example of completing the Interface Requirements/Restrictions List, whose context is an App for teaching spatial notions and laterality. Below are the suggested procedures for carrying out this activity.'
                            "",
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
                        text: ""
                            'Suggested Procedures:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Choose a moderator, which may be the same as for previous activities. The moderator should present on a blackboard or in printed form, the list of interface scenarios selected in the previous activity, as well as the Personas and the Empathy Map; From each scenario presented, participants will be able to identify the main and complementary elements of the interface scenario.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The GuideAut repository can be consulted to be consulted, in order to help define colors, shapes and other details; If more than one suggestion is obtained for each scenario, a “round” of the menu of ideas (or another preferred technique) must be carried out to select the ideas that will make up the project.'
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
