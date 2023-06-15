import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';

abstract class ProductsRepository {
  Future<ProductResponseEntity> fetchProducts();

  updateProducts(String productId);

  deleteProducts(String productId);
}
