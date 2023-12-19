import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/document_row.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class DocumentUploadView extends StatefulWidget {
  const DocumentUploadView({super.key});

  @override
  State<DocumentUploadView> createState() => _DocumentUploadViewState();
}

class _DocumentUploadViewState extends State<DocumentUploadView> {
  List documentList = [
    {
      "name": "Birth Certificate",
      "detail": "Vwhicle Registration",
      "info": "",
      "status": DocumentStatus.uploaded,
    },
    {
      "name": "Driving Licence",
      "detail": "Driving Licence details",
      "info": "",
      "status": DocumentStatus.uploading,
    },
    {
      "name": "Passport",
      "detail": "Passport details",
      "info": "",
      "status": DocumentStatus.upload,
    },
    {
      "name": "Election Card",
      "detail": "Election Card detaiks",
      "info": "",
      "status": DocumentStatus.upload,
    },
  ];

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
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var dObj = documentList[index] as Map? ?? {};
                  return DocumentRow(
                      dObj: dObj,
                      onPressed: () {},
                      onInfo: () {},
                      onUpload: () {},
                      onAction: () {},
                      status: dObj["status"] as DocumentStatus? ??
                          DocumentStatus.upload);
                },
                // separatorBuilder: (context, index) {
                //   return const Divider();
                // },
                itemCount: documentList.length),
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
