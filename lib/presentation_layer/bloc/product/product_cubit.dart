import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain_layer/usecases/fetch_products_uc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain_layer/entities/product_response_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final FetchProductsUC fetchProductsUC = FetchProductsUC();
  ProductCubit() : super(ProductInitialState());

  void fetchProducts() async {
    emit(ProductLoadingState());
    final result = await fetchProductsUC.execute();

    result.fold(
      (left) => emit(ProductFailureState()),
      (right) => emit(ProductSuccessState(right)),
    );
  }
}
