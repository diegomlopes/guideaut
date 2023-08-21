import 'package:flutter/material.dart';
import 'package:guideaut/common/widgets/custom_card.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
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
        text: AppLocalizations.of(context)!.proaut_tutorial,
        onPressed: () => Navigator.pushNamed(context, Routes.tutorial),
      ),
      CustomCard(
        icon: Icons.architecture,
        text: AppLocalizations.of(context)!.proaut_artifacts,
        onPressed: () {},
      ),
      CustomCard(
          icon: Icons.search,
          text: AppLocalizations.of(context)!.look_for_recomendations,
          onPressed: () => Navigator.pushNamed(
              context, Routes.searchRecomendationCategoriesPage)),
      CustomCard(
        icon: Icons.playlist_add,
        text: AppLocalizations.of(context)!.new_project,
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
                        AppLocalizations.of(context)!.the_guideAut,
                        style: imageHomeTitleTextStyle,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ""
                        '${AppLocalizations.of(context)!.guideAut_desc_1}'
                        '${AppLocalizations.of(context)!.guideAut_desc_2}'
                        '${AppLocalizations.of(context)!.guideAut_desc_3}'
                        '${AppLocalizations.of(context)!.guideAut_desc_4}'
                        '${AppLocalizations.of(context)!.guideAut_desc_5}'
                        '${AppLocalizations.of(context)!.guideAut_desc_6}'
                        '${AppLocalizations.of(context)!.guideAut_desc_7}'
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
                      AppLocalizations.of(context)!.the_guideAut,
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
                      '${AppLocalizations.of(context)!.guideAut_desc_1}'
                      '${AppLocalizations.of(context)!.guideAut_desc_2}'
                      '${AppLocalizations.of(context)!.guideAut_desc_3}'
                      '${AppLocalizations.of(context)!.guideAut_desc_4}'
                      '${AppLocalizations.of(context)!.guideAut_desc_5}'
                      '${AppLocalizations.of(context)!.guideAut_desc_6}'
                      '${AppLocalizations.of(context)!.guideAut_desc_7}'
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
