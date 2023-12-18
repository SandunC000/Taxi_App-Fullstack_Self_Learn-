import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/core/util/navigation_routes.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/line_text_field.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "Sri Lanka");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Sign In',
        backArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              "Mobile Number",
              style: TextStyle(color: TColor.primaryText, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final code = await countryCodePicker.showPicker(
                            context: context);
                        if (code != null) {
                          countryCode = code;
                          setState(() {});
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: countryCode.flagImage(),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            countryCode.dialCode,
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: TextField(
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "9876543210"),
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextField(
              title: "Password",
              hintText: "********",
              obscureText: true,
              controller: txtPassword,
              right: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined)),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            RoundButton(title: "SIGN IN", onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.MOBILE_NUMBER_VIEW);
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: TColor.primary, fontSize: 16),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
