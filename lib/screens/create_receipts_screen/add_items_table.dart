import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/items_controller.dart';

import '../../env/dimensions.dart';
import '../../widgets/custom_btn.dart';

import '../../widgets/custom_rich_text.dart';
import '../../widgets/custom_tablerow.dart';
import '../../widgets/custom_text.dart';
import 'thirdpage.dart';

class DataTableScreen extends StatelessWidget {
  DataTableScreen({Key? key}) : super(key: key);
  final itemscontroller = Get.put(ItemsController());
  var customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child:
                              const CustomText(text: AppStrings.ADD_ITEMS_NAME),
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
                          child:
                              const CustomText(text: AppStrings.ADD_ITEMS_QTY),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const CustomText(
                              text: AppStrings.ADD_ITEMS_ACTIONS),
                        ),
                      ),
                    ]),
                    ...itemscontroller.itemsList
                        .map((itemx) => CustomTableRow(
                              item: itemx,
                            ))
                        .toList(),
                  ],
                ),
              ),
              if (itemscontroller.itemsList.isNotEmpty)
                SizedBox(
                  height: Dimensions.calcH(25),
                ),
              if (itemscontroller.itemsList.isNotEmpty) const Divider(),
              if (itemscontroller.itemsList.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomRichText(
                    text: "${AppStrings.TOTAL} : \Tsh",
                    children: [
                      TextSpan(
                          text:
                              "${itemscontroller.totalInclusiveTax.toDouble().toStringAsFixed(2)}")
                    ],
                  ),
                ),
              if (itemscontroller.itemsList.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomRichText(
                    text: "${AppStrings.TOTALEXCLUSIVETAX} : \Tsh",
                    children: [
                      TextSpan(
                          text:
                              "${itemscontroller.exclusiveTax.toDouble().toStringAsFixed(2)}")
                    ],
                  ),
                ),
              if (itemscontroller.itemsList.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomRichText(
                    text: "${AppStrings.TAX} : \Tsh",
                    children: [
                      TextSpan(
                          text:
                              "${itemscontroller.tax.toDouble().toStringAsFixed(2)}")
                    ],
                  ),
                ),
              if (itemscontroller.itemsList.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomBtn(
                    label: "${AppStrings.PREVIEW}",
                    action: () {
                      /* final receipt = MyReceipt(
                          name:
                              '${customerController.customerNameInputController.text}',
                          paymenttype: 'customerController.selected.value',
                          idtype: 'customerController.selectedId.value');*/
                      Get.to(() => ThirdPage());
                    },
                    color: AppColors.kPrimaryColor,
                    textColor: Colors.white,
                    width: Dimensions.calcW(12),
                  ),
                ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              // height: 2000,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                ),
                color: AppColors.kSecondaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: itemscontroller.itemNameInputController,
                        // controller:  controller.,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                            //border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: true,
                            labelText: 'Item name'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: itemscontroller.itemPriceInputController,
                        // controller:  controller.,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                            //border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: true,
                            labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: itemscontroller.itemQtyInputController,
                        // controller:  controller.,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                            //border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: true,
                            labelText: 'Quantity'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: itemscontroller.itemDscntInputController,
                        // controller:  controller.,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                            //border: InputBorder.none,
                            fillColor: AppColors.kSecondaryColor,
                            filled: true,
                            labelText: 'Discount'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Row(
                        children: [
                          Expanded(child: Text('Select TAXCODE')),
                          Expanded(
                            child: SizedBox(
                              width: 50,
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
                                    onChanged: (newValue) {
                                      itemscontroller
                                          .setSelected(newValue as String);
                                    },
                                    value: itemscontroller.selected.value == ""
                                        ? null
                                        : itemscontroller.selected.value,
                                    items: itemscontroller.listType
                                        .map((selectedType) {
                                      return DropdownMenuItem(
                                        child: new Text(
                                          selectedType,
                                        ),
                                        value: selectedType,
                                      );
                                    }).toList(),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: CustomBtn(
                        label: AppStrings.ADD_BTN,
                        action: () {
                          bool isValid = itemscontroller.validate();
                          if (isValid) {
                            Get.close(1);
                          }
                        },
                        color: AppColors.kPrimaryColor,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
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
