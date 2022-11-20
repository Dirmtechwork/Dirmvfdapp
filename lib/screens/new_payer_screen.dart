import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../controllers/customer_controller.dart';
import '../env/dimensions.dart';
import '../widgets/appbar_eng_view.dart';
import '../widgets/custom_btn.dart';

import 'create_receipts_screen/add_items_table.dart';

class NewPayerScreen extends StatelessWidget {
  const NewPayerScreen({Key? key}) : super(key: key);

  //final customercontroller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    var dropdownTextList;
    return Scaffold(
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
            child: GetBuilder<CustomerController>(
              init: CustomerController(),
              builder: (controller) => Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.calcH(5),
                  horizontal: Dimensions.calcW(15),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.calcH(17),
                    ),
                    Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.calcH(10),
                          ),
                          Container(
                            color: AppColors.kSecondaryColor,
                            height: 50,
                            margin: EdgeInsets.only(
                              right: Dimensions.calcW(50),
                            ),
                            child: TextFormField(
                              controller:
                                  controller.customerNameInputController,
                              // controller:  controller.,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: AppColors.kSecondaryColor,
                                  filled: true,
                                  labelText: 'Customer name'),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.calcH(14),
                          ),
                          Container(
                            color: AppColors.kSecondaryColor,
                            height: 50,
                            margin: EdgeInsets.only(
                              right: Dimensions.calcW(50),
                            ),
                            child: TextFormField(
                              controller: controller.customerVrnInputController,
                              // controller:  controller.,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: AppColors.kSecondaryColor,
                                  filled: true,
                                  labelText: 'Customer VRN'),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.calcH(14),
                          ),
                          Container(
                            color: AppColors.kSecondaryColor,
                            height: 50,
                            margin: EdgeInsets.only(
                              right: Dimensions.calcW(50),
                            ),
                            child: TextFormField(
                              controller:
                                  controller.customerPhoneInputController,
                              // controller:  controller.,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: AppColors.kSecondaryColor,
                                  filled: true,
                                  labelText: 'Customer Mobile'),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.calcH(14),
                          ),
                          Container(
                            color: AppColors.kSecondaryColor,
                            height: 50,
                            margin: EdgeInsets.only(
                              right: Dimensions.calcW(50),
                            ),
                            child: Obx(() => DropdownButtonFormField<String>(
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                  ),
                                  hint: Text(
                                    'Select Payment Type',
                                  ),
                                  onChanged: (newValue) {
                                    controller.setSelected(newValue as String);
                                  },
                                  value: controller.selected.value == ""
                                      ? null
                                      : controller.selected.value,
                                  items:
                                      controller.listType.map((selectedType) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        selectedType,
                                      ),
                                      value: selectedType,
                                    );
                                  }).toList(),
                                )),
                          ),
                          SizedBox(
                            height: Dimensions.calcH(14),
                          ),
                          Container(
                            color: AppColors.kSecondaryColor,
                            height: 50,
                            margin: EdgeInsets.only(
                              right: Dimensions.calcW(50),
                            ),
                            child: Obx(() => DropdownButtonFormField<String>(
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                  ),
                                  hint: Text(
                                    'Select Customer Id Type',
                                  ),
                                  onChanged: (newValue) {
                                    controller
                                        .setSelectedId(newValue as String);
                                  },
                                  value: controller.selectedId.value == ""
                                      ? null
                                      : controller.selectedId.value,
                                  items: controller.listIds.map((selectedType) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        selectedType,
                                      ),
                                      value: selectedType,
                                    );
                                  }).toList(),
                                )),
                          ),
                          SizedBox(
                            height: Dimensions.calcH(14),
                          ),
                          Container(
                            color: AppColors.kSecondaryColor,
                            height: 50,
                            margin: EdgeInsets.only(
                              right: Dimensions.calcW(50),
                            ),
                            child: TextFormField(
                              controller: controller.customerIdController,
                              // controller:  controller.,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: AppColors.kSecondaryColor,
                                  filled: true,
                                  labelText: 'Customer ID'),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.calcH(16),
                    ),
                    CustomBtn(
                      label: AppStrings.SAVE_ITEMS,
                      action: () {
                        /* final receipt = MyReceipt(
                            name:
                                'customerController.customerNameInputController.text',
                            paymenttype: 'customerController.selected.value',
                            idtype: 'customerController.selectedId.value');*/
                        Get.to(() => DataTableScreen());
                      },
                      color: AppColors.kPrimaryColor,
                      textColor: Colors.white,
                      width: Dimensions.calcW(150),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
