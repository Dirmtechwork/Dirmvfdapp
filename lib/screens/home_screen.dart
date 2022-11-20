// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/strings.dart';
import '../env/dimensions.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_btn.dart';
import '../widgets/app_drawer.dart';
import 'package:get/get.dart';

import 'create_receipts_screen/create_receipt.dart';
import 'create_receipts_screen/new_receipts.dart';
import 'create_receipts_screen/new_receipts_info.dart';
import 'new_payer_screen.dart';
import 'new_receipt_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('DirmVfdApp'),
        centerTitle: true,
        elevation: 1,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/invoice_logo.svg",
              height: Dimensions.calcH(120),
              color: Colors.white,
            ),
            SizedBox(
              height: Dimensions.calcH(15),
            ),
            CustomText(
              text: AppStrings.APP_NAME,
              color: Colors.white,
              weight: FontWeight.bold,
              fontSize: Dimensions.calcH(25),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomText(
              text: AppStrings.APP_DESC,
              color: Colors.white,
              weight: FontWeight.w600,
              height: 1.3,
              fontSize: Dimensions.calcH(18),
            ),
            CustomText(
              text: AppStrings.APP_word,
              color: Colors.white,
              weight: FontWeight.w600,
              height: 1.3,
              fontSize: Dimensions.calcH(18),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomBtn(
              label: AppStrings.START_BTN,
              action: () {
                Get.to(() => NewPayerScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
