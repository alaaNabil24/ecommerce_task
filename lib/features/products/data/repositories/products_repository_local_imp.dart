import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:market_app_task/features/products/domain/entities/product_data.dart';
import 'package:market_app_task/features/products/domain/repositories/products_repository_local.dart';

import 'dart:convert';

class ProductsRepositoryLocalImpl implements ProductsRepositoryLocal {
  final String boxName = "market";
  final String productsKey = "products";

  @override
  Future<List<dynamic>> getProducts() async {
    final dbBox = await Hive.openBox(boxName);
    final cachedProducts = dbBox.get(productsKey);

    if (cachedProducts != null && cachedProducts.isNotEmpty) {
      return cachedProducts;
    } else {
      return [];
    }
  }

  @override
  Future<void> cacheProducts(List<dynamic> products) async {
    final dbBox = await Hive.openBox(boxName);
    await dbBox.put(productsKey, products);
    if (kDebugMode) {
      print("Products cached successfully  ${dbBox.get(productsKey)} ");
    }
  }
}
