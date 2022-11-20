import 'package:get/get.dart';

import '../controllers/receipt_controller.dart';

class NewReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReceiptController(),
    );
  }
}
