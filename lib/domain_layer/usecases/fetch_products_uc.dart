import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/domain_layer/repositories/products_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../core/app_api.dart';
import '../../data_layer/data_sources/products_ds.dart';
import '../../data_layer/repositoires/products_repository.dart';

class FetchProductsUC {
  final ds = ProductsDSImpl(
    client: ApiClient(
      dio: Dio(BaseOptions(baseUrl: ApiClient.baseURL)),
    ),
  );
  Future<Either<String, ProductResponseEntity>> execute() async {
    final ProductsRepository repository = ProductsRepositoryImpl(ds);
    try {
      ProductResponseEntity response = await repository.fetchProducts();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
