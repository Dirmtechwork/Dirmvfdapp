import 'business_model.dart';
import 'customer_model.dart';
import 'item_model.dart';

import 'package:flutter/services.dart';

class Receipt {
  String id;
  String date;
  Business from;
  Customer to;
  List<Item> items;
  String paymentInstructions;
  double total;
  ByteData signature;
  Receipt(
      {required this.id,
      required this.date,
      required this.from,
      required this.to,
      required this.items,
      required this.paymentInstructions,
      required this.total,
      required this.signature});
}
