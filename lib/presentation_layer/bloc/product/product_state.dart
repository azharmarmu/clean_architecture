part of 'product_cubit.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccessState extends ProductState {
  final ProductResponseEntity entity;

  ProductSuccessState(this.entity);
  @override
  List<Object?> get props => [entity];
}

class ProductFailureState extends ProductState {
  @override
  List<Object?> get props => [];
}
