import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/core/util/navigation_routes.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/line_text_field_col.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class BankDetailsView extends StatefulWidget {
  const BankDetailsView({super.key});

  @override
  State<BankDetailsView> createState() => _BankDetailsViewState();
}

class _BankDetailsViewState extends State<BankDetailsView> {
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAccHolderName = TextEditingController();
  TextEditingController txtAccNumber = TextEditingController();
  TextEditingController txtSwiftCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Bank Details',
        backArrow: true,
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
            LineTextFieldCol(
              title: "Bank Name",
              hintText: "Standard Charted",
              obscureText: false,
              controller: txtBankName,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Account Holder Name",
              hintText: "John Smith",
              obscureText: false,
              controller: txtAccHolderName,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Account Number",
              hintText: "ACNO123456789",
              obscureText: false,
              controller: txtAccNumber,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Swift/IFSC Code",
              hintText: "YT1234",
              obscureText: false,
              controller: txtSwiftCode,
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
            RoundButton(title: "NEXT", onPressed: () {Navigator.pushNamed(context, Routes.DOCUMENT_UPLOAD_VIEW);}),
          ],
        ),
      ),
    );
  }
}
