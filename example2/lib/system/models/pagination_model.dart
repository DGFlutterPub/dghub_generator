import '../../gen/product/models/product.dart';

class PaginatedModel<T> {
  final List<Product> products;
  final int currentPage;
  final int totalPages;

  PaginatedModel({
    required this.products,
    required this.currentPage,
    required this.totalPages,
  });

  factory PaginatedModel.fromJson(Map<String, dynamic> json) {
    return PaginatedModel(
      products:
          List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
    );
  }
}
