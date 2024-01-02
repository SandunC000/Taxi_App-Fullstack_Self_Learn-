import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taxi_app/features/presentation/views/add_vehicle_view/add_vehicle_view.dart';
import 'package:taxi_app/features/presentation/views/add_vehicle_view/vehicle_document_upload_view.dart';
import 'package:taxi_app/features/presentation/views/registering_documents/bank_details_view.dart';
import 'package:taxi_app/features/presentation/views/change_language_view/change_language.dart';
import 'package:taxi_app/features/presentation/views/mobile_number_view/mobile_number_view.dart';
import 'package:taxi_app/features/presentation/views/otp_view/otp_view.dart';
import 'package:taxi_app/features/presentation/views/registering_documents/document_upload_view.dart';
import 'package:taxi_app/features/presentation/views/sign_in_view/sign_in_view.dart';
import 'package:taxi_app/features/presentation/views/sign_up_view/sign_up_view.dart';
import 'package:taxi_app/features/presentation/views/subscription_plan_view/subscription_plan_view.dart';
import 'package:taxi_app/features/presentation/views/welcome_view/welcome_view.dart';

class Routes { 
  static const String CHANGE_LANGUAGE = "CHANGE_LANGUAGE";
  static const String WELCOME = "WELCOME";
  static const String MOBILE_NUMBER_VIEW = "MOBILE_NUMBER_VIEW";
  static const String OTP_VIEW = "OTP_VIEW";
  static const String SIGN_IN_VIEW = "SIGN_IN_VIEW";
  static const String SIGN_UP_VIEW = "SIGN_UP_VIEW";
  static const String BANK_DETAILS_VIEW = "BANK_DETAILS_VIEW";
  static const String DOCUMENT_UPLOAD_VIEW = "DOCUMENT_UPLOAD_VIEW";
  static const String ADD_VEHICLE_VIEW = "ADD_VEHICLE_VIEW";
  static const String VEHICLE_DOCUMENT_UPLOAD_VIEW = "VEHICLE_DOCUMENT_UPLOAD_VIEW";
  static const String SUBSCRIPTION_PLAN_VIEW = "SUBSCRIPTION_PLAN_VIEW";


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
      case Routes.SIGN_UP_VIEW:
        return PageTransition(
          child: const SignUpView(), type: PageTransitionType.fade,
        );
      case Routes.BANK_DETAILS_VIEW:
        return PageTransition(
          child: const BankDetailsView(), type: PageTransitionType.fade,
        );
      case Routes.DOCUMENT_UPLOAD_VIEW:
        return PageTransition(
          child: const DocumentUploadView(), type: PageTransitionType.rightToLeft,
        );
      case Routes.ADD_VEHICLE_VIEW:
        return PageTransition(
          child: const AddVehicleView(), type: PageTransitionType.rightToLeft,
        );
      case Routes.VEHICLE_DOCUMENT_UPLOAD_VIEW:
        return PageTransition(
          child: const VehicleDocumentUploadView(), type: PageTransitionType.rightToLeft,
        );
      case Routes.SUBSCRIPTION_PLAN_VIEW:
        return PageTransition(
          child: const SubscriptionPlanView(), type: PageTransitionType.rightToLeft,
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

