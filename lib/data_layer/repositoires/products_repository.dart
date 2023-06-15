import 'package:clean_architecture/data_layer/data_sources/products_ds.dart';

import '../../domain_layer/repositories/products_repository.dart';
import '../models/product_response_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDS ds = ProductsDSImpl();
  @override
  Future<ProductResponseModel> fetchProducts() async {
    final response = await ds.fetchProducts();
    return response;
  }

  @override
  updateProducts(String productId) {
    // TODO: implement updateProducts
    throw UnimplementedError();
  }

  @override
  deleteProducts(String productId) {
    // TODO: implement deleteProducts
    throw UnimplementedError();
  }
}
