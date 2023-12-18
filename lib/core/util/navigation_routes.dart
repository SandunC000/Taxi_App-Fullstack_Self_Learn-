import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taxi_app/features/presentation/views/change_language_view/change_language.dart';
import 'package:taxi_app/features/presentation/views/mobile_number_view/mobile_number_view.dart';
import 'package:taxi_app/features/presentation/views/welcome_view/welcome_view.dart';

class Routes {
  static const String CHANGE_LANGUAGE = "CHANGE_LANGUAGE";
  static const String WELCOME = "WELCOME";
  static const String MOBILE_NUMBER_VIEW = "MOBILE_NUMBER_VIEW";

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
      case Routes.MOBILE_NUMBER_VIEW:
        return PageTransition(
          child: const MobileNumberView(), type: PageTransitionType.fade,
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

