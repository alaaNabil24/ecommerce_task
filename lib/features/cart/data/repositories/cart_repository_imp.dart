import 'package:dartz/dartz.dart';

import '../../domain/entities/cart_data.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/local/cart_db_service.dart';

class CartRepositoryImp implements CartRepository {
  CartDBService cartDBService = CartDBService();

  @override
  Future<void> deleteProductFromCart(id) async {
    await cartDBService.deleteProductFromCart(id);
  }

  @override
  Future<Either<String, List<CartItem>>> getCartData() async {
    if (await cartDBService.getCartData() == []) {
      return Future.value(const Left("Cart is empty"));
    } else {
      return Future.value(Right(await cartDBService.getCartData()));
    }
  }
}
