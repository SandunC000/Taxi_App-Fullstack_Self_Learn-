import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class DocumentUploadView extends StatefulWidget {
  const DocumentUploadView({super.key});

  @override
  State<DocumentUploadView> createState() => _DocumentUploadViewState();
}

class _DocumentUploadViewState extends State<DocumentUploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Personal Documents',
        backArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            RoundButton(title: "NEXT", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
