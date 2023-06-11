class MenuEntity {
  final String title;
  final String thumbnail;
  final int price;
  final int? stock;
  final int? order;
  final String? tag;

  MenuEntity({
    required this.title,
    required this.thumbnail,
    required this.price,
    this.stock,
    this.order,
    this.tag,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        title: json["title"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        stock: json["stock"],
        order: json["order"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnail": thumbnail,
        "price": price,
        "stock": stock,
        "order": order,
        "tag": tag,
      };
}
