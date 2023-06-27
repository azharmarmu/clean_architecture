import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain_layer/usecases/fetch_products_uc.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/app_api.dart';
import '../../../data_layer/data_sources/products_ds.dart';
import '../../../data_layer/repositoires/products_repository.dart';
import '../../../domain_layer/entities/product_response_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final repo = ProductsRepositoryImpl(ProductsDSImpl(
    client: ApiClient(
      dio: Dio(BaseOptions(baseUrl: ApiClient.baseURL)),
    ),
  ));

  ProductCubit() : super(ProductInitialState());

  void fetchProducts() async {
    final FetchProductsUC fetchProductsUC = FetchProductsUC(repo);
    emit(ProductLoadingState());
    final result = await fetchProductsUC.execute();

    result.fold(
      (left) => emit(ProductFailureState()),
      (right) => emit(ProductSuccessState(right)),
    );
  }
}
