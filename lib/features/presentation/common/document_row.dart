import 'package:flutter/material.dart';

import '../../../core/util/app_colors.dart';

enum DocumentStatus { upload, uploading, uploaded }

class DocumentRow extends StatelessWidget {
  final Map dObj;
  final VoidCallback onPressed;
  final VoidCallback onInfo;
  final VoidCallback onUpload;
  final VoidCallback onAction;
  final DocumentStatus status;

  const DocumentRow(
      {super.key,
      required this.dObj,
      required this.onPressed,
      required this.onInfo,
      required this.onUpload,
      required this.onAction,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        dObj["name"] as String? ?? "",
                        style:
                            TextStyle(color: TColor.primaryText, fontSize: 12),
                      ),
                      IconButton(
                        onPressed: onInfo,
                        icon: const Icon(Icons.info),
                      ),
                    ],
                  ),
                  Text(
                    dObj["detail"] as String? ?? "",
                    style: TextStyle(color: TColor.primaryText, fontSize: 12),
                  ),
                ],
              )),
              if (status == DocumentStatus.uploaded)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onAction,
                      icon: const Icon(Icons.check_circle),
                    )
                  ],
                )
              else if (status == DocumentStatus.uploading)
                SizedBox(
                    width: 25,
                    height: 25,

                    child: CircularProgressIndicator(
                      value: 0.3,
                      color: TColor.primary,
                      backgroundColor: TColor.placeholder,
                    ))
              else
                TextButton(
                  onPressed: onUpload,
                  child: Text(
                    "UPLOAD",
                    style: TextStyle(color: TColor.primaryText, fontSize: 12),
                  ),
                ),
            ],
          ),
          Divider(thickness: 1,),
        ],
      ),
    );
  }
}
