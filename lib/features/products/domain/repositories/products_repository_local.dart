import '../entities/product_data.dart';

abstract class ProductsRepositoryLocal {
  Future<List<dynamic>> getProducts();
  // save data in local DB
  Future<void> cacheProducts(List<dynamic> products);
}
