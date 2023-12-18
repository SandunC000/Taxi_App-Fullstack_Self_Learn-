import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/core/util/app_images.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.welcomeBg,
            width: context.width,
            height: context.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black54.withOpacity(0.8),
          ),
          SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                AppImages.logo,
                width: context.width * 0.4,
                color: Colors.white,
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RoundButton(title: "SIGN IN", onPressed: () {}),
              ),
              TextButton(
                  onPressed: () {},
                  child: Center(
                      child: Text("SIGN UP",
                          style: TextStyle(
                            color: TColor.primaryTextW,
                            fontSize: 16,
                          )))),
              const SizedBox(
                height: 20,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
