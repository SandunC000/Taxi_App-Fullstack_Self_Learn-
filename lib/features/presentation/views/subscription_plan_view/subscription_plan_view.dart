import 'package:flutter/material.dart';
import 'package:taxi_app/features/presentation/common/app_bar.dart';
import 'package:taxi_app/features/presentation/common/plan_row.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  List planArr = [
    {
      "name": "Basic Plan",
      "time": "1 Month",
      "rides": "10 Rides Everyday",
      "cash_rides": "2 Cash Rides",
      "km": "50km travel rides",
      "price": "TRY FREE"
    },
    {
      "name": "Classic Plan",
      "time": "3 Month",
      "rides": "10 Rides Everyday",
      "cash_rides": "2 Cash Rides",
      "km": "50km travel rides",
      "price": "BUY AT \$20.50"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Subscription Plans',
        backArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView.builder(
          itemCount: planArr.length,
          itemBuilder: (context, index) {
            var pObj = planArr[index] as Map? ?? {};
            return PlanRow(pObj: pObj, onPressed: () {});
          },
        ),
      ),
    );
  }
}
