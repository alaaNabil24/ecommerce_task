import 'package:dartz/dartz.dart';

import '../entities/product_data.dart';

abstract class ProductsRepositoryApi {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, String>> addProductToCart( {required int id,
    required String name,
    required double price,
    required String image});
}
