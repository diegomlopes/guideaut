import 'package:flutter/material.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/admin_panel/recomendations/data/datasources/recomendation_firebase_datasource.dart';
import 'package:guideaut/features/auth/domain/usecases/get_logged_user.dart';
import 'package:guideaut/features/tutorial/presentation/analysis_phase/analysis_phase_page.dart';
import 'package:guideaut/features/tutorial/presentation/ideation_phase/ideation_phase_page.dart';
import 'package:guideaut/features/tutorial/presentation/immersion_phase/immersion_phase_page.dart';
import 'package:guideaut/features/tutorial/presentation/prototyping_phase/prototyping_phase_page.dart';
import 'package:guideaut/pages/about_page.dart';
import 'package:guideaut/pages/admin_panel_page.dart';
import 'package:guideaut/pages/contact_page.dart';
import 'package:guideaut/pages/home_page.dart';
import 'package:guideaut/pages/proaut_page.dart';
import 'package:guideaut/pages/search_recomendations.dart';
import 'package:guideaut/pages/sign_in_page.dart';
import 'package:guideaut/pages/tools_page.dart';
import 'package:guideaut/pages/tutorial_page.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  RecomendationFirebaseDatasource().getCategories();

  // AuthFirebaseDatasource().forgotPassword("diego.lopes.developer@gmail.com");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        // maxWidth: 1500,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.home:
              return const HomePage();
            case Routes.proaut:
              return const ProautPage();
            case Routes.tools:
              return const ToolsPage();
            case Routes.signin:
              return const SignInPage();
            case Routes.about:
              return const AboutPage();
            case Routes.contact:
              return const ContactPage();
            case Routes.tutorial:
              return const TutorialPage();
            case Routes.imersionPhasePage:
              return const ImmersionPhasePage();
            case Routes.analysisPhasePage:
              return const AnalysisPhasePage();
            case Routes.ideationPhasePage:
              return const IdeationPhasePage();
            case Routes.prototypingPhasePage:
              return const PrototypingPhasePage();
            case Routes.adminPanelPage:
              return const AdminPanelPage();
            case Routes.searchRecomendationsPage:
              return const SearchRecomendations();
            default:
              return const SizedBox.shrink();
          }
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
