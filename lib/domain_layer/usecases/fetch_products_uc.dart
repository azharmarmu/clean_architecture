import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/domain_layer/repositories/products_repository.dart';
import 'package:either_dart/either.dart';

import '../../data_layer/repositoires/products_repository.dart';

class FetchProductsUC {
  final ProductsRepository repository = ProductsRepositoryImpl();
  Future<Either<String, ProductResponseEntity>> execute() async {
    try {
      ProductResponseEntity response = await repository.fetchProducts();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
