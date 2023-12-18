import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taxi_app/features/presentation/views/change_language_view/change_language.dart';
import 'package:taxi_app/features/presentation/views/mobile_number_view/mobile_number_view.dart';
import 'package:taxi_app/features/presentation/views/otp_view/otp_view.dart';
import 'package:taxi_app/features/presentation/views/sign_in_view/sign_in_view.dart';
import 'package:taxi_app/features/presentation/views/welcome_view/welcome_view.dart';

class Routes {
  static const String CHANGE_LANGUAGE = "CHANGE_LANGUAGE";
  static const String WELCOME = "WELCOME";
  static const String MOBILE_NUMBER_VIEW = "MOBILE_NUMBER_VIEW";
  static const String OTP_VIEW = "OTP_VIEW";
  static const String SIGN_IN_VIEW = "SIGN_IN_VIEW";

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

      case Routes.SIGN_IN_VIEW:
        return PageTransition(
          child: const SignInView(), type: PageTransitionType.fade,
        );
      case Routes.OTP_VIEW:
        final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: OTPView(
            code: args['code'] as String,
            number: args['number'] as String,
          ),
          type: PageTransitionType.fade,
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

