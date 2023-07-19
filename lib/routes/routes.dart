import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String home = "/";
  static const String proaut = "proaut";
  static const String tools = "tools";
  static const String signin = "signin";
  static const String signup = "signup";
  static const String about = "about";
  static const String contact = "contact";
  static const String tutorial = "tutorial";
  static const String imersionPhasePage = "imersion-phase";
  static const String analysisPhasePage = "analysis-phase";
  static const String ideationPhasePage = "ideation-phase";
  static const String prototypingPhasePage = "prototyping-phase";
  static const String adminPanelPage = "admin-panel";
  static const String searchRecomendationsPage = "search";

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}
