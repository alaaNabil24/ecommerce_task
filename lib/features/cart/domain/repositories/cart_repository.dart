import 'package:dartz/dartz.dart';


import '../entities/cart_data.dart';



abstract class CartRepository {
  Future<Either<String, List<CartItem>>> getCartData();
  Future<void> deleteProductFromCart(id);
}
