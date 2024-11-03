import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:market_app_task/features/cart/domain/entities/cart_data.dart';

class CartDBService {
  Future<List<CartItem>> getCartData() async {
    if (!Hive.isBoxOpen("cart")) {
      await Hive.openBox<CartItem>("cart");
    }
    final dbBox = Hive.box<CartItem>("cart");

    debugPrint(" dbBox.get(cart)${dbBox.values.toList()}");
    return dbBox.values.toList();
  }

  Future<void> deleteProductFromCart(id) async {
    if (!Hive.isBoxOpen("cart")) {
      await Hive.openBox<CartItem>("cart");
    }
    final dbBox = Hive.box<CartItem>("cart");
    dbBox.deleteAt(id);
  }
}
