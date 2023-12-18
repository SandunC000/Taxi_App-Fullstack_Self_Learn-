import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/core/util/navigation_routes.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  List listArr = [
    "Arabic",
    "Chinese",
    "English",
    "Korean",
    "Sinhala",
  ];

  int selectChange = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Change Language',
        backArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: listArr.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      setState(() {
                        selectChange = index;
                      });
                      Navigator.pushReplacementNamed(context, Routes.WELCOME);
                    },
                    title: Text(
                      listArr[index],
                      style: TextStyle(
                          color: index == selectChange
                              ? TColor.primary
                              : TColor.primaryText,
                          fontSize: 16),
                    ),
                    trailing: index == selectChange
                        ? Icon(
                            Icons.check,
                            color: TColor.primary,
                          )
                        : null);
              },
            ))
          ],
        ),
      ),
    );
  }
}
