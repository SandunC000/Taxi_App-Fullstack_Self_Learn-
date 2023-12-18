import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class MobileNumberView extends StatefulWidget {
  const MobileNumberView({super.key});

  @override
  State<MobileNumberView> createState() => _MobileNumberViewState();
}

class _MobileNumberViewState extends State<MobileNumberView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  TextEditingController txtMobile = TextEditingController();

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
        title: 'Enter Mobile Number',
        backArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                const SizedBox(
                  width: 20,
                ),
                Expanded(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By Continuing, I confirm that I have read & agree to the",
                  style: TextStyle(color: TColor.secondaryText, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Terms & Conditions",
                  style: TextStyle(color: TColor.primaryText, fontSize: 12),
                ),
                Text(
                  " and ",
                  style: TextStyle(color: TColor.secondaryText, fontSize: 12),
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(color: TColor.primaryText, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 25),
            RoundButton(title: "Continue", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
