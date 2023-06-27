import 'package:clean_architecture/data_layer/models/product_response_model.dart';
import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/domain_layer/repositories/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_producrs_uc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductsRepository>()])
void main() {
  group(
    'Fetch Product',
    () {
      test(
        'Get Product Entity',
        () async {
          //logic
          //before logic, make sure to run build runner command (flutter pub run build_runner build)
          final mockProductRepository = MockProductsRepository();

          when(
            mockProductRepository.fetchProducts(),
          ).thenAnswer(
            (realInvocation) => Future.value(
              ProductResponseModel.fromJson(fakeData) as ProductResponseEntity,
            ),
          );

          final result = await mockProductRepository
              .fetchProducts(); //return ProductResponseModel

          expect(
            result,
            ProductResponseModel.fromJson(
              fakeData,
            ),
          );
        },
      );
    },
  );
}

Map<String, dynamic> fakeData = {
  "status": true,
  "message": "Prodcts list .",
  "data": [
    {
      "id": "1",
      "pname": "Raw Apple",
      "size": "200ml",
      "prize": "109",
      "image":
          "http://iroidtechnologies.in/Fressery/assets/images/image_three.png"
    },
    {
      "id": "2",
      "pname": "Specil Lassi",
      "size": "200ml",
      "prize": "550",
      "image":
          "http://iroidtechnologies.in/Fressery/assets/images/image_two.png"
    },
  ]
};
