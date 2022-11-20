import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../controllers/receipt_controller.dart';
import '../controllers/receipts_controller.dart';
import '../env/dimensions.dart';
import '../models/receipt_model.dart';
import '../utils/functions.dart';
import '../widgets/appbar_eng_view.dart';
import '../widgets/custom_btn.dart';
import '../widgets/option_view_eng.dart';
import '../widgets/payment_instructions.dart';

class NewReceiptScreen extends StatelessWidget {
  const NewReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.kSecondaryColor,
      appBar: AppBar_eng(
        title: AppStrings.NEW_RECEIPT_PAGE_TITLE,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              "assets/icons/circle_close.svg",
              color: AppColors.kPrimaryDark,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<ReceiptController>(
                init: ReceiptController(),
                builder: (controller) {
                  if (controller.id == "0") {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    controller.id = id;
                  } else {}

                  return Column(
                    children: [
                      OptionView_eng(
                        onTap: () {},
                        title: AppStrings.NEW_RECEIPT_TITLE + controller.id,
                        subTitle: AppStrings.NEW_RECEIPT_SUBTITLE +
                            Functions.formatDate(
                              DateTime.now(),
                            ),
                        showArrow: false,
                      ),
                      OptionView_eng(
                        onTap: () {
                          Get.toNamed("/add_business");
                        },
                        title: AppStrings.NEW_RECEIPT_BUSINESS,
                        subTitle: AppStrings.NEW_RECEIPT_BUSINESS_SUBTITLE,
                        leading: SvgPicture.asset("assets/icons/business.svg"),
                        isComplete:
                            (controller.business != null) ? true : false,
                        showArrow: (controller.business != null) ? false : true,
                      ),
                      OptionView_eng(
                        onTap: () {
                          Get.toNamed("/add_payer");
                        },
                        title: AppStrings.NEW_RECEIPT_PAYER,
                        subTitle: AppStrings.NEW_RECEIPT_PAYER_SUBTITLE,
                        leading:
                            SvgPicture.asset("assets/icons/person_add.svg"),
                        isComplete:
                            (controller.customer != null) ? true : false,
                        showArrow: (controller.customer != null) ? false : true,
                      ),
                      OptionView_eng(
                        onTap: () {
                          Get.toNamed("/add_items");
                        },
                        title: AppStrings.NEW_RECEIPT_ITEMS,
                        subTitle: (controller.itemsList.isEmpty)
                            ? AppStrings.NEW_RECEIPT_ITEMS_SUBTITLE
                            : "${controller.itemsList.length} have been added",
                        leading: SvgPicture.asset("assets/icons/add_item.svg"),
                      ),
                      OptionView_eng(
                        onTap: () {
                          if (controller.paymentInstructions == null) {
                            Get.defaultDialog(
                              title: AppStrings.ADD_PAYMENT_INSTRUCTIONS_TITLE,
                              content: PaymentInstructions(),
                            );
                          }
                        },
                        title: AppStrings.NEW_RECEIPT_PAYMENT,
                        subTitle: AppStrings.NEW_RECEIPT_PAYMENT_SUBTITLE,
                        leading:
                            SvgPicture.asset("assets/icons/payment_method.svg"),
                        isComplete: (controller.paymentInstructions != null)
                            ? true
                            : false,
                        showArrow: (controller.paymentInstructions != null)
                            ? false
                            : true,
                      ),
                      OptionView_eng(
                        onTap: () {
                          Get.toNamed("/sign_invoice");
                        },
                        title: AppStrings.NEW_RECEIPT_SIGNATURE,
                        subTitle: AppStrings.NEW_RECEIPT_SIGNATURE_SUBTITLE,
                        leading:
                            SvgPicture.asset("assets/icons/signature_pen.svg"),
                        isComplete:
                            (controller.signature != null) ? true : false,
                        showArrow:
                            (controller.signature != null) ? false : true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomBtn(
                            label: AppStrings.PREVIEW_BTN,
                            action: () {
                              if (controller.business != null &&
                                  controller.customer != null &&
                                  controller.signature != null &&
                                  controller.paymentInstructions != null &&
                                  controller.itemsList.isNotEmpty) {
                                Receipt receipt =
                                    controller.generate_preview_invoice();
                                Get.toNamed("/preview",
                                    arguments: {"invoice": receipt});
                              } else {
                                Get.snackbar("Error",
                                    "Please enter all the required fields!",
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            },
                          ),
                          SizedBox(
                            width: Dimensions.calcW(20),
                          ),
                          CustomBtn(
                            label: AppStrings.SAVE_BTN,
                            color: AppColors.kPrimaryColor,
                            textColor: Colors.white,
                            action: () {
                              if (controller.business != null &&
                                  controller.customer != null &&
                                  controller.signature != null &&
                                  controller.paymentInstructions != null) {
                                Receipt receipt =
                                    controller.generate_preview_invoice();
                                Get.find<AllReceiptController>()
                                    .createNewReceipt(receipt);
                                Get.back();
                              } else {
                                Get.snackbar("Error",
                                    "Please enter all the required fields!",
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
