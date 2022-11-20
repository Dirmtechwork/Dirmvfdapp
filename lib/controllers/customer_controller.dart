import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/customer_model.dart';

class CustomerController extends GetxController {
  Customer? customer;
  TextEditingController customerNameInputController = TextEditingController();
  TextEditingController customerVrnInputController = TextEditingController();
  TextEditingController customerPhoneInputController = TextEditingController();
  TextEditingController customerTinInputController = TextEditingController();
  TextEditingController customerPaymenttypeInputController =
      TextEditingController();
  TextEditingController customerIdtypeController = TextEditingController();
  TextEditingController customerIdController = TextEditingController();
  TextEditingController customerEmailInputController = TextEditingController();
  TextEditingController customerAddressInputController =
      TextEditingController();
  final List<String> listType = <String>['CASH', 'CHEQUE', 'CCARD', 'EMONEY'];
  final List<String> listIds = <String>[
    'TIN',
    'DRIVING LICENSE',
    'VOTERS NUMBER',
    'PASSPORT',
    'NID(National Identity)',
    'NIL(If there is no ID)'
  ];

  final selected = "".obs;
  final selectedId = "".obs;

  void setSelectedId(String value) {
    selectedId.value = value;
  }

  void setSelected(String value) {
    selected.value = value;
  }

  // validate input
  bool validate() {
    if (customerNameInputController.text.isEmpty ||
        customerVrnInputController.text.isEmpty ||
        customerPhoneInputController.text.isEmpty ||
        customerTinInputController.text.isEmpty ||
        customerPaymenttypeInputController.text.isEmpty ||
        customerIdtypeController.text.isEmpty ||
        customerIdController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      customer = Customer(
          vrn: customerVrnInputController.text,
          tin: customerTinInputController.text,
          name: customerNameInputController.text,
          phone: customerPhoneInputController.text,
          paymenttype: customerPaymenttypeInputController.text,
          idtype: customerIdtypeController.text,
          id: customerIdController.text);
      return true;
    }
  }

  @override
  void onClose() {
    if (customer != null) {
      customerVrnInputController.clear();
      customerTinInputController.clear();
      customerNameInputController.clear();
      customerPhoneInputController.clear();
      customerPaymenttypeInputController.clear();
      customerIdtypeController.clear();
      customerIdController.clear();
      //  Get.find<ReceiptController>().setCustomer(customer!);
    }
    super.onClose();
  }
}
