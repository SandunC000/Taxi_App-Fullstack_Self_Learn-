import 'package:flutter/material.dart';
import 'package:taxi_app/features/presentation/views/mobile_number_view/mobile_number_view.dart';
import 'package:taxi_app/features/presentation/views/otp_view/otp_view.dart';
import 'package:taxi_app/features/presentation/views/sign_in_view/sign_in_view.dart';
import 'package:taxi_app/features/presentation/views/splash_view/splash_view.dart';
import 'package:taxi_app/features/presentation/views/welcome_view/welcome_view.dart';

import 'core/util/app_colors.dart';
import 'core/util/navigation_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Driver',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: TColor.bg,
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const SignInView(),
    );
  }
}

