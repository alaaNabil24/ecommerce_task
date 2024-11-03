import 'package:dartz/dartz.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_api.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_local.dart';

import '../entities/product_data.dart';

class ProductsUseCase {
  final ProductsRepositoryApi _productsRepositoryApi;
  final ProductsRepositoryLocal _productsRepositoryLocal;

  ProductsUseCase(this._productsRepositoryApi, this._productsRepositoryLocal);

  Future<Either<String, List<Product>>> getProductsFromApi() async {
    return await _productsRepositoryApi.getProducts();
  }

  Future<Either<String, String>> addProductToCart( {required int id,
    required String name,
    required double price,
    required String image}) async {
    return await _productsRepositoryApi.addProductToCart( id: id, name: name, price: price, image: image);
  }

  Future<List<dynamic>> getProductsFromLocal() async {
    return await _productsRepositoryLocal.getProducts();
  }

  Future<void> cacheProducts({required List<dynamic> products}) async {
    return await _productsRepositoryLocal.cacheProducts(products);
  }
}
