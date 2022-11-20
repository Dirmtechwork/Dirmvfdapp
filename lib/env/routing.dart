import 'package:get/get.dart';

import '../screens/business_details_screen.dart';

import '../screens/items_binding.dart';
import '../screens/new_item_screen.dart';
import '../screens/new_payer_screen.dart';
import '../screens/new_receipt_binding.dart';
import '../screens/new_receipt_screen.dart';

import 'links.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
      name: AppLinks.NEW_RECEIPT,
      page: () => const NewReceiptScreen(),
      transition: Transition.fadeIn,
      binding: NewReceiptBinding(),
    ),
    GetPage(
      name: AppLinks.NEW_BUSINESS,
      page: () => const NewBusinessScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_PAYER,
      page: () => const NewPayerScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_ITEM,
      page: () => NewItemScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ItemsBidning(),
    )
  ];
}
