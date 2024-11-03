part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {}

class CartError extends CartState {
  String message;
  CartError(this.message);
}

class DeleteFromCartSuccess extends CartState {
 String id  ;
  DeleteFromCartSuccess({required this.id});

}
