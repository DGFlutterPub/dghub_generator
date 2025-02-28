class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int page;
  final bool isSynced;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.page,
    required this.isSynced,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      page: json['page'],
      isSynced: json['isSynced'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'page': page,
      'isSynced': isSynced ? 1 : 0,
    };
  }
}
