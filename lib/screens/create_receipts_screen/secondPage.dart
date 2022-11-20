import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/customer_controller.dart';
import '../../controllers/items_controller.dart';
import 'thirdpage.dart';

class SecondPage extends StatelessWidget {
  var customerController = Get.put(CustomerController());
  var itemscontroller = Get.put(ItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: GestureDetector(
          onTap: () {
            /* final receipt = MyReceipt(
                name: '${customerController.customerNameInputController.text}',
                paymenttype: 'customerController.selected.value',
                idtype: 'customerController.selectedId.value');*/
            Get.to(() => ThirdPage());
          },
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: Center(
                    child: Text('click',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
