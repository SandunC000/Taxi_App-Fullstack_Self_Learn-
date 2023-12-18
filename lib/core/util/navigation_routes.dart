import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taxi_app/features/presentation/views/change_language_view/change_language.dart';
import 'package:taxi_app/features/presentation/views/welcome_view/welcom_view.dart';

class Routes {
  static const String CHANGE_LANGUAGE = "CHANGE_LANGUAGE";
  static const String WELCOME = "WELCOME";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){
      case Routes.CHANGE_LANGUAGE:
        return PageTransition(
          child: const ChangeLanguage(), type: PageTransitionType.fade,
        );
      case Routes.WELCOME:
        return PageTransition(
          child: const WelcomeView(), type: PageTransitionType.fade,
        );


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}

