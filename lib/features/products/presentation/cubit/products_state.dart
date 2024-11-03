part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {

}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}


class AddToCartSuccess extends ProductsState {
  final String message;
  AddToCartSuccess({required this.message});
}

class AddToCartError extends ProductsState {
  final String message;
  AddToCartError({required this.message});
}

class AddToCartLoading extends ProductsState {}
