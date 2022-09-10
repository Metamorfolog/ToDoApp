class Item {
  late final String itemName;
  late final String itemDescription;
  late final bool itemStatus;

  Item({
    required this.itemName,
    required this.itemDescription,
    required this.itemStatus,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        itemName: json['itemName'],
        itemDescription: json['itemDescription'],
        itemStatus: json['itemStatus'],
      );
}
