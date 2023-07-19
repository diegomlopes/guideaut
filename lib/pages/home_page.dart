import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/custom_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: <Widget>[
              const MiddleBar(),
              const MenuTopBar(),
              isPhone(constraints.maxWidth)
                  ? const BannerHomePhone()
                  : const BannerHomeTablerOrDesktop(),
              const CardListHome(),
              const Footer(),
            ],
          );
        }),
      ),
    );
  }
}

class CardListHome extends StatelessWidget {
  const CardListHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(children: <Widget>[
      CustomCard(
        icon: Icons.auto_stories,
        text: "ProAut Tutorial",
        onPressed: () => Navigator.pushNamed(context, Routes.tutorial),
      ),
      CustomCard(
        icon: Icons.architecture,
        text: "ProAut Artifacts",
        onPressed: () {},
      ),
      CustomCard(
          icon: Icons.search,
          text: "Look For Recomendations",
          onPressed: () =>
              Navigator.pushNamed(context, Routes.searchRecomendationsPage)),
      CustomCard(
        icon: Icons.playlist_add,
        text: "New Project",
        onPressed: () {},
      ),
    ]);
  }
}

class BannerHomePhone extends StatelessWidget {
  const BannerHomePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "The GuideAut",
                        style: imageHomeTitleTextStyle,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ""
                        'GuideAut was conceived to provide technological support to ProAut, '
                        'a process to support the development of application interfaces for '
                        'autistic people. GuideAut contains collaborative system properties, '
                        'design recommendations for graphical interfaces that make applications '
                        'more attractive to such an audience, as well as specific characteristics '
                        'of autistic profiles to help generate empathy between autistics and the '
                        'development team, through the use of of ProAut artifacts.'
                        "",
                        style: imageHomeTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  'assets/images/banner_home.png',
                  // color: Colors.white.withOpacity(0.5),
                  // colorBlendMode: BlendMode.modulate,
                ),
              ),
            ]);
      }),
    );
  }
}

class BannerHomeTablerOrDesktop extends StatelessWidget {
  const BannerHomeTablerOrDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "The GuideAut",
                      style: imageHomeTitleTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ""
                      'GuideAut was conceived to provide technological support to ProAut, '
                      'a process to support the development of application interfaces for '
                      'autistic people. GuideAut contains collaborative system properties, '
                      'design recommendations for graphical interfaces that make applications '
                      'more attractive to such an audience, as well as specific characteristics '
                      'of autistic profiles to help generate empathy between autistics and the '
                      'development team, through the use of of ProAut artifacts.'
                      "",
                      style: imageHomeTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: constraints.maxWidth * 0.4,
            child: Image.asset(
              'assets/images/banner_home.png',
              // color: Colors.white.withOpacity(0.5),
              // colorBlendMode: BlendMode.modulate,
            ),
          ),
        ]);
      }),
    );
  }
}

bool isPhone(double size) {
  if (size <= 800) {
    return true;
  } else {
    return false;
  }
}
