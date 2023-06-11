class OrderEntity {
  final String title;
  final int price;
  final int qty;
  final String? notes;

  OrderEntity({
    required this.title,
    required this.price,
    required this.qty,
    this.notes,
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) => OrderEntity(
        title: json["title"],
        price: json["price"],
        qty: json["qty"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "qty": qty,
        "notes": notes,
      };
}
