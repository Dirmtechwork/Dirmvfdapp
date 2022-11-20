import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/item_model.dart';

class ItemsController extends GetxController {
  //final receiptcontroller = Get.put(ReceiptController());
  //final RxList<Item> _itemsList = Get.find<ReceiptController>().itemsList;

  RxList<Item> _itemsList = <Item>[].obs;

  // RxDouble _totalext = 0.00.obs;

  RxDouble _exclusiveTax = 0.0.obs;
  RxDouble _tax = 0.0.obs;
  RxDouble _totalInclusiveTax = 0.0.obs;

  final RxDouble _total = 0.00.obs;
  final RxDouble _totalex = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itemDscntInputController = TextEditingController();
  final List<String> listType = <String>[
    'CODE A',
    'CODE B',
    'CODE C',
    'CODE D'
  ];
  final selected = "".obs;

  RxDouble get exclusiveTax => _exclusiveTax;
  RxDouble get totalInclusiveTax => _totalInclusiveTax;

  RxDouble get tax => _tax;
  get itemsList => _itemsList;
  get total => _total;
  get totalex => _totalex;

  // validate form;

  void setSelected(String value) {
    selected.value = value;
  }

  bool validate() {
    if (itemNameInputController.text.isEmpty ||
        itemPriceInputController.text.isEmpty ||
        itemDscntInputController.text.isEmpty ||
        itemQtyInputController.text.isEmpty ||
        selected.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (!itemPriceInputController.text.isNum ||
        !itemQtyInputController.text.isNum) {
      Get.snackbar(
        "Error",
        "Item Price/Qty can only be a number",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      add_item(
        item_name: itemNameInputController.text,
        item_price: double.parse(itemPriceInputController.text),
        item_discount: double.parse(itemDscntInputController.text),
        item_qty: int.parse(itemQtyInputController.text),
        item_taxCode: selected.value,
      );

      itemNameInputController.clear();
      itemPriceInputController.clear();
      itemQtyInputController.clear();
      itemDscntInputController.clear();

      update();
      return true;
    }
  }

  void setItems(List<Item> val) async {
    itemsList.addAll(val);
    await Future.delayed(const Duration(milliseconds: 20), () {
      update();
    });
  }

  // add new item
  void add_item(
      {required String item_name,
      required double item_price,
      double? item_discount,
      required int item_qty,
      required String item_taxCode}) {
    _itemsList.add(
      Item(
        name: item_name,
        price: item_price,
        qty: item_qty,
        discount: item_discount,
        taxcode: item_taxCode,
      ),
    );
    calcTotal();
    calcTotalExcT();
    update();
    ;
  }

  void remove_item({required Item item}) {
    _itemsList.remove(item);
    update();
    calcTotal();

    calcTotalExcT();
  }

  void clear_items() {
    _itemsList.clear();
    update();
    calcTotal();
    calcTotalExcT();
  }

  calcTotalExcT() {
    double exTax = 0.0;
    double tax = 0.0;
    double inTax = 0.0;
    /*  _itemsList.forEach((item) {
      if (item.taxcode == 'CODE A') {
        print('code A');
        exTax = exTax + ((item.price * item.qty) / 1.18);
        tax += ((item.price * item.qty) - exTax);
        inTax += ((exTax + tax) - item.discount!);
      }
    }); */

    for (int i = 0; i < _itemsList.length; i++) {
      final item = _itemsList[i];
      if (item.taxcode == "CODE A") {
        exTax = exTax + ((item.price * item.qty) / 1.18);
        tax = ((item.price * item.qty * (i + 1)) - exTax);
        inTax = ((exTax + tax) - item.discount!);
      } else {
        inTax = inTax + ((item.price * item.qty) - item.discount!);
      }
    }
    // add to obx
    _exclusiveTax.value = exTax;
    _tax.value = tax;
    _totalInclusiveTax.value = inTax;
  }

  // void calcTotalExc() => _totalex.value = _itemsList.fold(0,
  //  (previousValue, next) => previousValue + (next.price * next.qty) / 1.18);

  void calcTotal() => _total.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (next.price * next.qty) - next.discount!);

  // void calcTax() => _tax.value = _itemsList.fold(
  //    0,
  //    (previousValue, next) =>
  //       (previousValue + (next.price * next.qty)) -
  //    (previousValue + (next.price * next.qty) / 1.18));
}
