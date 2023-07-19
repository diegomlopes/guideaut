import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/full_card.dart';
import 'package:guideaut/common/widgets/image_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
              "Immersion Phase",
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
                            'The immersion phase is the phase characterized by approaching the problem. It is at this stage that the team seeks to learn about concepts that permeate the theme of the App to be designed. To obtain these inputs, various types of research are carried out, such as interviews, trend searches and direct observation.'
                            "",
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
                        text: ""
                            'Phase input: the application idea or overview;\n'
                            'Phase output: CCA (Autistic Caregivers Canvas);\n'
                            'CTA (Canvas of Autistic Therapists);\n'
                            'CSS (Software Requestor Canvas);\n'
                            'Autistic Characterization Form answered;\n'
                            'and VGA (Autistic Overview Chart);\n'
                            'Involved: Parents, specialists, software requester, Designers/developers;\n'
                            'Phase Activities: Learn about the context, Elicit Requirements and Consolidate Data, represented and detailed below.'
                            "",
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
                        text: ""
                            'Immersion phase activities'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Learn about the context'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'As the name implies, at this stage the designer/team must seek information both about autism and its relationship with the context of the App (which we call the theme here), called the Research Desk. With a user-centered focus, this context also concerns studying and understanding the characteristics of the autistic, and how these characteristics influence the actions to be taken to design the desired interface. Figure 5 presents a diagram with an overview of this activity and its sub-activities.'
                            "",
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
                        text: ""
                            'Procedural suggestions'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. Elaborate the search items (Based on the overview of the application), that is, terms and/or keywords to be used in the desk search that are related to Autism. TIP: If the designer/team does not have any affinity with the Autism theme, it is suggested that the following be included: Concept of autism, levels of autism, forms of communication of an autistic person, main characteristics and limitations of an autistic person, action/reaction of the autistic in relation to the context of the application;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '2. Define terms and words that conform to the context of an application. For example, assuming the context of an App to teach laterality (right and left sides), then one should seek information on how the autistic person understands what the right and left side is, what are the main difficulties that an autistic person has to understand what it is left and right side. TIP: In general, regardless of the topic, it is suggested that you always look for questions about what the autistic person likes and dislikes in relation to the proposed topic, what are their difficulties in relation to the proposed topic (app context); and, finally, what types of solutions (other apps for example) already exist for the topic in question, and if this solution has any relation;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '3. Define the search sources (books, websites, videos, magazines, blogs of parents and/or specialists in autism, related articles, etc.); Run the search. TIP: Write down the results of the searches in handwritten or typed form, including the source data for a possible need to consult again. For that, something like the example below is suggested.'
                            "",
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
                        text: ""
                            'Elicit from requirements'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'In this activity, information is extracted from the client about what he wants to be built. It is the moment of conversation with the user, of feeling about what he expects to be delivered. In addition, in this activity, the needs of the system and the characteristics that it must have are perceived. The techniques defined for the Elicit Requirements activity in ProAut are: Interviews and Exploratory Research. In addition, this activity has a sub-activity called Autistic Characterization, which consists of applying the FCA (Autistic Characterization Form), and is carried out during the interview with parents and specialists. The Elicit Requirements activity generates, as artifacts, a set of annotations as well as the completed FCA. These artifacts will serve as input for the next activity (Data Consolidation). Figure 6 presents a diagram that allows a complete view of the Requirements Elicitation activity.'
                            "",
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
                        text: ""
                            'Interviews'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'ProAut contemplates 3 types of interviews, namely: interview with the applicant, interview with caregivers and interview with therapists. The interview with the applicant is mandatory, since it is he who will pass on the needs of the software/Application. A list of questions is available for each type of interview. However, the interviewer need not be limited to this script. That is, just as he may feel the need to ask new questions to complement the answers, he may also fail to ask any.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Interview with applicant – the first interview must be conducted with the applicant for the application. It should collect information about the purpose of the application, which skills you want to be worked on by the application, as well as the desired requirements and functionalities. The following table presents the list of questions to ask the applicant:'
                            "",
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
                        text: ""
                            'Interview with Caregivers – the interview with caregivers must be conducted after the interview with the applicant for the application. The reason is that, in possession of the knowledge about the objectives and needs of the application, some questions related to the theme/context of the application are asked. Thus, in this interview, the designer/team should collect information, for example, regarding the social aspects of the autistic, activities that calm/stress, relationship with technologies, among others. The table presents a script to be used for interviewing caregivers:'
                            "",
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
                        text: ""
                            'Interview with therapists – the interview with specialists should also be carried out after the interview with the applicant, for the same reason given for caregivers. In addition, the selection of some specialists is done according to the objectives and needs of the application. For example: an application aimed at education (literacy, teaching mathematics, vowels, etc.) should consider an interview with a pedagogue specializing in autistic education; an application aimed at helping the verbal development of considering an interview with a speech therapist who specializes in autistic care; and so on. In the interview with specialists, the designer/team should collect information, for example, regarding the social aspects of the autistic, activities that calm/stress, relationship with technologies, among others. The following table presents questions to ask therapists:'
                            "",
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
                        text: ""
                            'NOTE: If you have difficulties interviewing parents/guardians and/or specialists, the designer/developer can use GuideAut, a repository composed of information about autistic people (in development).'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Suggestion of Procedure for the interviews:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. Make an appointment with the interviewee;\n'
                            '2. For specialists only, the selection should be made according to the area of expertise in relation to the purpose and needs of the software;\n'
                            '3. Define the means to record the interview (audio recording, notebook, filming, etc.);\n'
                            '4. Provide material for recording the interview;\n'
                            '5. Arrive in advance at the interview location;\n'
                            '6. Except for the applicant, explain the objectives and needs of the software as well as the purpose of the interview and present the TCLE (Free and Informed Consent Form) and request its signature (or agreement for the virtual case);\n'
                            '7. Also except for the applicant, explain about filling out the FCA. Since for the specialist, he should respond based on the majority of consultations. For example, in question 25 (walks on tiptoe) the specialist should answer yes (1) if the majority of those assisted have this characteristic;\n'
                            '8. Before using the proposed script, ask and write down the name of the interviewee;\n'
                            '9. Start the interview using the suggested script;\n'
                            '10. Only for parents/guardians/guardians and specialists to apply the FCA.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Characterize the Autistic'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'It consists of applying the FCA, whose information will serve as the basis for Personas techniques, Empathy Map in the Analysis phase. The same should be presented at the beginning of interviews with caregivers and therapists. The FCA is a form divided into 4 sections, representing the 4 main areas of limitation of an autistic person, namely: Interaction, Communication, Behavior and Cognition. Each section is made up of a set of characteristics for which the interviewer must mark the value 1, when the child presents the characteristic, and 0 otherwise. Completing the FCA produces a chart called the Autistic Overview Chart (VGA), which allows you to visualize the degree of impairment in each of the areas. So, the higher the percentage of autistic individuals in a given area, the greater the commitment in that area. The figure below presents an example of the VGA, in which it can be seen that the communication area is the most compromised, followed by the areas of interaction and cognition, both with more than 50% of compromise.'
                            "",
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
                        text: ""
                            'Suggestion of Procedure:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. Print the FCA (if it is not possible to apply electronically);\n'
                            '2. Before starting the interview with the parents/guardians and talking about the need to complete the FCA;\n'
                            '3. Define whether the FCA will be applied before or after the interview;\n'
                            '4. Start the application of the FCA marking for each characteristic item, the value 1 if the characteristic is present in the child or 0 in case of absence.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'It should be noted that the characteristic is considered present if the autistic person presents it even sporadically. On the other hand, he is considered absent if he has never presented himself, or if he presented himself very rarely throughout his life;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Exploratory research'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The Exploratory Research is an optional activity, and should be carried out if the designer/team feels the need to deepen the knowledge regarding the daily life of autistic people. The Exploratory Research is done through observation in a real environment that involves an autistic person in relation to the theme of the project. It can be at school, in an office or even at home.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Remembering that there is no intervention, only observation. This research helps the designer/team not only to come up with good ideas, but also to define and better understand the profile of autistic people. The observer cannot interact with or interfere with the observed scenario (he must be like “a fly on the wall”).'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Suggestion of Procedure:'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            '1. Schedule the procedure with a family/specialist/teacher/school, that is, the person responsible for the place where the exploratory research will be carried out;\n'
                            '2. Define the means to record the observation (audio recording, notebook, filming, etc.);\n'
                            '3. Provide material for recording the observation;\n'
                            '4. Arrive early at the venue;\n'
                            '5. Record the child\'s forms of interaction and behavior in their daily lives;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Consolidate Data'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The Consolidate Data activity consists of analyzing the information obtained from the responses to the interviews carried out, and mapping them to the corresponding Canvas. For example, the answers to the interviews carried out with specialists should be analyzed and mapped to the ASC (Autims´s Specialists Canvas), here simplified to the Specialist Canvas, and so on. This step produces the properly completed Canvas as artifacts, along with the FCA(s) and the respective VGA(s). The following figure presents each type of interview associated with its respective Canvas.'
                            "",
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
                        text: ""
                            'Mapping of interviews to the corresponding Canvas'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Mapping the customer interview script to the CCS'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The mapping of questions asked to the requester to the Requesters\' Canvas is shown in the following figure. Each question must be mapped according to the numbers presented in the respective Figure. For example, questions 1, 2 and 3 should be mapped to section 1 (Profile) of the canvas, question 4 to section 2, question 5 to 3 and so on.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Most of the questions will have to be mapped through the analysis and extraction of relevant information obtained in the interview, and can be presented in the form of topics or textually.'
                            "",
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
                        text: ""
                            'Mapping of the caregivers\' interview script for the CCA'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The mapping of the questions asked to the parents/guardians/guardians to the corresponding canvas is shown in Figure 10. As in the ARC, the APC can also be completed both in the form of topics and textually, and each question must be mapped in the section according to the numbers shown in Figure 10.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'For the Profile section, some remarks:'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Question 1: With the ages obtained in each interview with the parents/guardians, define the age range, taking the lowest age as the lower limit and the highest age as the upper limit. For example, if the ages obtained were 6, 8, 10, and 5 years old, the defined age range will be 5 to 10 years old;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Question 2: State the type of communication: verbal, non-verbal or echolalic verbal (that is, summarize in one of these classifications);'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Question 3: Depending on the number of respondents, create an interval with the different series obtained. For example: in the item attending school, if the majority is yes, put the grade interval on the canvas. For example, if a child attends the 3rd, another 4th and another 5th of elementary school, then on the canvas you should put from 3rd to 5th grade of elementary school. If the majority does not attend school, insert “does not attend school” on the canvas;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Question 4: take the different answers and check the one that appears the most. For example, if 2 children live with their parents, 1 with their mother and 1 with their grandmother, transcribe “lives with their parents” onto Canvas, as it represents the majority;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Questions 6 and 7 – Depending on the quantity, put the majority answer. For example: in the item attending school, if the majority is yes, put it.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'For the other sections, analyze each response and extract the most relevant information, and map it to the corresponding section, as shown in the figure below.'
                            "",
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
                        text: ""
                            'Mapping of the experts\' interview script for the ASC (Autism\'s Specialists Canvas)'
                            "",
                        textStyle: imageHomeSubTitleTextStyle,
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'The mapping of questions asked to experts to the corresponding canvas is shown in the following figure. As with the previous mappings, each question must be mapped in the section according to the numbers presented. For example, questions 1, 2 and 3 for section 1 (Profile) of the ASC, question 4 for section 2 (stereotypies/manias) and so on.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'For the Profile section, some remarks:'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Question 1: With the ages obtained in each interview, define the age range, taking the lowest age as the lower limit and the highest as the upper limit. For example, if the ages obtained were 6, 8, 10, and 5, the defined age range will be 5 to 10 years old;'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Question 2: State the type of communication: verbal, non-verbal or echolalic verbal.'
                            "",
                        onPressed: () {},
                      ),
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
                        text: ""
                            'Eliminate conflicts – In a given interview, if an answer that conflicts with another interview is obtained, the one with the highest incidence (number of similar ones) should be used. Example: Suppose that in an interview with a certain mother, this one answers that taking a shower is a stressing activity, and in another interview with another mother, this same answer appears as an activity that calms down. In this case, you should evaluate the highest incidence of responses from respondents (other respondents), or simply choose the one that, in your view and/or experience, is more convenient for the section of the canvas.'
                            "",
                        onPressed: () {},
                      ),
                      FullCard(
                        text: ""
                            'Transferring the FCA to the electronic medium – if it has not been possible to use the FCA in the electronic mode, it must be transferred to that mode, so that it is possible to generate the VGA. OBS: It is important to point out that if it is not possible to carry out interviews with parents or specialists, please consult GuideAut.'
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
