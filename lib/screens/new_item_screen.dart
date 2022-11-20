import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../controllers/items_controller.dart';
import '../env/dimensions.dart';
import '../widgets/appbar_eng_view.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_input_eng.dart';
import '../widgets/custom_rich_text.dart';
import '../widgets/custom_tablerow.dart';
import '../widgets/custom_text.dart';

class NewItemScreen extends GetView<ItemsController> {
  const NewItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_eng(
        title: AppStrings.ADD_PAYER_TITLE,
        showBackArrow: true,
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimensions.calcH(5),
                horizontal: Dimensions.calcW(15),
              ),
              child: Obx(() {
                return Column(
                  children: [
                    if (controller.itemsList.isNotEmpty)
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: <Widget>[
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.ADD_ITEMS_NAME),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.ADD_ITEMS_PRICE),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.ADD_ITEMS_QTY),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: const CustomText(
                                      text: AppStrings.ADD_ITEMS_ACTIONS),
                                ),
                              ),
                            ],
                          ),
                          ...controller.itemsList
                              .map((itemx) => CustomTableRow(
                                    item: itemx,
                                  ))
                              .toList(),
                        ],
                      )
                    else
                      const Center(
                        child: Text("You did not add any item yet!"),
                      ),
                    if (controller.itemsList.isNotEmpty)
                      SizedBox(
                        height: Dimensions.calcH(25),
                      ),
                    if (controller.itemsList.isNotEmpty) const Divider(),
                    if (controller.itemsList.isNotEmpty)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomRichText(
                          text: "${AppStrings.TOTAL} : \$",
                          children: [
                            TextSpan(
                                text:
                                    "${controller.total.value.toStringAsFixed(2)}")
                          ],
                        ),
                      ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: AppStrings.ADD_ITEMS_DIALOG_TITLE,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(),
                  CustomInput_eng(
                    label: "Item name",
                    controller: controller.itemNameInputController,
                  ),
                  CustomInput_eng(
                      label: AppStrings.ADD_ITEMS_PRICE,
                      controller: controller.itemPriceInputController,
                      type: TextInputType.number),
                  CustomInput_eng(
                    label: AppStrings.ADD_ITEMS_QTY,
                    controller: controller.itemQtyInputController,
                    type: TextInputType.number,
                  ),
                  CustomBtn(
                    label: AppStrings.ADD_BTN,
                    action: () {
                      bool isValid = controller.validate();
                      if (isValid) {
                        Get.close(1);
                      }
                    },
                    color: AppColors.kPrimaryColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: AppColors.kSecondaryColor,
          size: 35,
        ),
        backgroundColor: AppColors.kPrimaryColor,
      ),
    );
  }
}
