import 'package:clean_architecture/core/app_api.dart';
import 'package:clean_architecture/data_layer/data_sources/products_ds.dart';
import 'package:dio/dio.dart';

import '../../domain_layer/repositories/products_repository.dart';
import '../models/product_response_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDS ds = ProductsDSImpl(
    client: ApiClient(
      dio: Dio(BaseOptions(baseUrl: ApiClient.baseURL)),
    ),
  );
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
