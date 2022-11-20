import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewReceiptController extends GetxController {
  final NewReceiptFormKey = GlobalKey<FormState>();
  TextEditingController clientNameInputController = TextEditingController();
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

  RxString newReceiptController = ''.obs;
  // var name = '';

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    //  clientNameInputController.text = 'gooo';
    super.onInit();
    clientNameInputController.addListener(() {
      newReceiptController.value = clientNameInputController.text;
    });
  }

  // @override
  // void onClose() {
  //   clientNameInputController.dispose();
  //   super.onClose();
  // }

}
