import 'package:clean_architecture/core/app_api.dart';
import 'package:dio/dio.dart';

import '../models/product_response_model.dart';

abstract class ProductsDS {
  Future<ProductResponseModel> fetchProducts();
  updateProducts();
  deleteProducts();
}

class ProductsDSImpl extends ProductsDS {
  final ApiClient client;

  ProductsDSImpl({required this.client});
  @override
  Future<ProductResponseModel> fetchProducts() async {
    final response = await client.request(ApiClient.fetchProducts);
    //convert this response to model
    return ProductResponseModel.fromJson(response);
  }

  @override
  updateProducts() {
    // TODO: implement updateProducts
    throw UnimplementedError();
  }

  @override
  deleteProducts() {
    // TODO: implement deleteProducts
    throw UnimplementedError();
  }
}
