import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/items_controller.dart';
import '../../env/dimensions.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/list_ob.dart';
import '../printscreen.dart';
import 'print_screen.dart';

class ThirdPage extends StatelessWidget {
  //final MyReceipt receipt;
  // var newReceiptController = Get.put(NewReceiptController());
  var customerController = Get.put(CustomerController());
  var itemscontroller = Get.put(ItemsController());
  // final customerController = Get.find<CustomerController>();
  ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receipt = MyReceipt(
        name: customerController.customerNameInputController.text,
        paymenttype: customerController.selected.value,
        idtype: customerController.selectedId.value);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Text("${receipt.name}"),
            // Text(customerController.customerNameInputController.text),
            Text("${receipt.paymenttype}"),
            Text("${receipt.idtype}"),
            Text(customerController.customerVrnInputController.text),
            Text(customerController.customerPhoneInputController.text),
            Text(customerController.customerTinInputController.text),
            //  Text(customerController.customerIdController.text),
            //  Text(customerController.selectedId.value),
            Text(itemscontroller.exclusiveTax.toDouble().toStringAsFixed(2)),
            CustomBtn(
              label: AppStrings.PRINT,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Print(receipt),
                  ),
                );

                // Get.to(() => PrintPage(receipt));
              },
              color: AppColors.kPrimaryColor,
              textColor: Colors.white,
              width: Dimensions.calcW(12),
            ),
          ],
        ),
      ),
    );
  }
}
