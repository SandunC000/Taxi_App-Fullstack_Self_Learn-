import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/core/util/app_images.dart';
import 'package:taxi_app/core/util/navigation_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    load();
  }

  void load() async {
    await Future.delayed(const Duration(seconds: 1));
    loadNextScreen();
  }

  void loadNextScreen(){
    Navigator.pushReplacementNamed(context, Routes.CHANGE_LANGUAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: TColor.primary,
          ),
          Image.asset(AppImages.logo,width: context.width*0.4,color: Colors.white,),
        ],
      ),
    );
  }
}
