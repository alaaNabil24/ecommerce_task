import 'package:dartz/dartz.dart';

import '../entities/cart_data.dart';
import '../repositories/cart_repository.dart';

class CartUseCase {
  CartRepository _cartRepository;

  CartUseCase(this._cartRepository);

  Future<void> deleteProductFromCart(int id) async {
    return await _cartRepository.deleteProductFromCart(id);
  }

  Future<Either<String, List<CartItem>>> getCartData() async {
    return await _cartRepository.getCartData();
  }
}
