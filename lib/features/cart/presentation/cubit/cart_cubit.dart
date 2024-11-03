import 'package:bloc/bloc.dart';
import 'package:market_app_task/features/products/domain/entities/product_data.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartUseCase) : super(CartInitial());

  final CartUseCase _cartUseCase;

  List<Product> cartItems = [];

  Future<void> getCartData() async {
    emit(CartLoading());
    final result = await _cartUseCase.getCartData();
    result.fold(
      (l) => emit(CartError(l)),
      (r) {
        cartItems = r
            .map((e) => Product(
                id: int.parse(e.id),
                title: e.name ,
                price: e.price,
                description: "",
                image: e.image))
            .toList();
        emit(CartLoaded());
      },
    );
  }

  Future<void> deleteProductFromCart(int id) async {
    final result = await _cartUseCase.deleteProductFromCart(id);
    emit(DeleteFromCartSuccess(id: id.toString()));
  }

  String getTotalPrice(items) {
    return items
        .map((e) => e.price)
        .reduce((value, element) => value + element)
        .toString();
  }
}
