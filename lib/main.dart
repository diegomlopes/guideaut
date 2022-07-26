import 'package:flutter/material.dart';
import 'package:guideaut/pages/about_page.dart';
import 'package:guideaut/pages/contact_page.dart';
import 'package:guideaut/pages/home_page.dart';
import 'package:guideaut/pages/proaut_page.dart';
import 'package:guideaut/pages/sign_in_page.dart';
import 'package:guideaut/pages/tools_page.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
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
            default:
              return const SizedBox.shrink();
          }
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
