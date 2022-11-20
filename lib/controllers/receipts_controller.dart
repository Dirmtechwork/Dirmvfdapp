import 'package:get/get.dart';

import '../models/receipt_model.dart';

class AllReceiptController extends GetxController {
  final RxList _invoicesList = [].obs;

  get invoicesList => _invoicesList;
  // get invoicesList => _invoicesList;
  // get all invoices
  // creeate new invoice
  void createNewReceipt(Receipt receipt) => _invoicesList.add(receipt);
  // download inovice
  // delete invoice
}
