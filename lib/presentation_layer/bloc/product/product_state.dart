part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final ProductResponseEntity entity;

  ProductSuccessState(this.entity);
}

class ProductFailureState extends ProductState {}
