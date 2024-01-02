import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/document_row.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class VehicleDocumentUploadView extends StatefulWidget {
  const VehicleDocumentUploadView({super.key});

  @override
  State<VehicleDocumentUploadView> createState() =>
      _VehicleDocumentUploadViewState();
}

class _VehicleDocumentUploadViewState extends State<VehicleDocumentUploadView> {
  List documentList = [
    {
      "name": "Vehicle Book",
      "detail": "Vehicle Registration",
      "info": "",
      "status": DocumentStatus.uploaded,
    },
    {
      "name": "Insurance Policy",
      "detail": "Driving Licence details",
      "info": "",
      "status": DocumentStatus.uploading,
    },
    {
      "name": "Owner Certificate",
      "detail": "Passport details",
      "info": "",
      "status": DocumentStatus.upload,
    },
    {
      "name": "ECO Certificate",
      "detail": "Election Card details",
      "info": "",
      "status": DocumentStatus.upload,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Vehicle Documents',
        backArrow: true,
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
                      onInfo: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                width: context.width,
                                height: context.height - 100,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 46, horizontal: 20),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 3)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Vehicle Book",
                                      style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 15),
                                    Expanded(
                                        child: SingleChildScrollView(
                                      child: Text(
                                        "dummy text",
                                        style: TextStyle(
                                          color: TColor.secondaryText,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "Okay",
                                              style: TextStyle(
                                                  color: TColor.primary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      onUpload: () {},
                      onAction: () {},
                      status: dObj["status"] as DocumentStatus? ??
                          DocumentStatus.upload);
                },
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
