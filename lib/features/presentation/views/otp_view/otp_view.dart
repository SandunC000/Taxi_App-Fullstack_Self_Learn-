import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/core/util/navigation_routes.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class OTPView extends StatefulWidget {
  final String number;
  final String code;

  const OTPView({super.key, required this.number, required this.code});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  TextEditingController txtMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'OTP Verification',
        backArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "Enter the 4-digit code sent to you at",
              style: TextStyle(color: TColor.secondaryText, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.code} ${widget.number}",
                  style: TextStyle(color: TColor.primaryText, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Text(
                    "Edit",
                    style: TextStyle(color: TColor.secondary, fontSize: 16),
                  ),
                ),
              ],
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: TColor.placeholder,
              focusedBorderColor: TColor.primary,
              textStyle: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
              ),
              showFieldAsBox: false,
              borderWidth: 3,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            RoundButton(title: "SUBMIT", onPressed: () {}),
            Center(
              child: OtpTimerButton(
                onPressed: () {},
                text: const Text(
                  "Resend OTP",
                  style: TextStyle(fontSize: 16),
                ),
                duration: 60,
                height: 60,
                buttonType: ButtonType.text_button,
                backgroundColor: TColor.primaryText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
