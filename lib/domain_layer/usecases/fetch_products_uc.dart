import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/domain_layer/repositories/products_repository.dart';

import 'package:either_dart/either.dart';

class FetchProductsUC {
  final ProductsRepository repository;

  const FetchProductsUC(this.repository);

  Future<Either<String, ProductResponseEntity>> execute() async {
    try {
      ProductResponseEntity response = await repository.fetchProducts();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
