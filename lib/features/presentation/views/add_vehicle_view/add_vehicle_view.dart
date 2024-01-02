import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/navigation_routes.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/line_text_field_col.dart';
import 'package:taxi_app/features/presentation/common/round_button.dart';

class AddVehicleView extends StatefulWidget {
  const AddVehicleView({super.key});

  @override
  State<AddVehicleView> createState() => _AddVehicleViewState();
}

class _AddVehicleViewState extends State<AddVehicleView> {
  TextEditingController txtServiceType = TextEditingController();
  TextEditingController txtBrandName = TextEditingController();
  TextEditingController txtModelName = TextEditingController();
  TextEditingController txtManufacturer = TextEditingController();
  TextEditingController txtNumberPlate = TextEditingController();
  TextEditingController txtColor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Add Vehicle',
        backArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            LineTextFieldCol(
              title: "Service Type",
              hintText: "Ex : Micro",
              obscureText: false,
              controller: txtServiceType,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Brand",
              hintText: "Ex : BMW",
              obscureText: false,
              controller: txtBrandName,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Model",
              hintText: "Ex : E520",
              obscureText: false,
              controller: txtModelName,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Manufacturer ",
              hintText: "Ex : BMW",
              obscureText: false,
              controller: txtManufacturer,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Vehicle Number",
              hintText: "Ex : ABC-1234",
              obscureText: false,
              controller: txtNumberPlate,
            ),
            const Divider(
              thickness: 1,
            ),
            LineTextFieldCol(
              title: "Car Color ",
              hintText: "Ex : Red",
              obscureText: false,
              controller: txtColor,
            ),
            const Divider(
              thickness: 1,
            ),
            RoundButton(
                title: "REGISTER",
                onPressed: () {
                  Navigator.pushNamed(
                      context, Routes.VEHICLE_DOCUMENT_UPLOAD_VIEW);
                }),
          ],
        ),
      ),
    );
  }
}
