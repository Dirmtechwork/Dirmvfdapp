class Item {
  String name;
  int qty;
  double price;
  double? discount;
  String? taxcode;

  Item(
      {required this.name,
      required this.qty,
      required this.price,
      this.taxcode,
      this.discount});
  List<String> toList() => [
        name,
        "$qty",
        "\Tsh${price.toStringAsFixed(2)}",
        ((price * qty).toStringAsFixed(2)),
        "$taxcode"
      ];
}
