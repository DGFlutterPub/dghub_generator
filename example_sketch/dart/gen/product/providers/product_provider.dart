import '../apis/product_api.dart';

final productProvider = FutureProvider<Product>((ref) async {
  return await ProductApi().getOne();
});

extension ProductExtension on WidgetRef {
  Product product get => watch(productProvider);
  
}
