import 'package:clean_architecture/data_layer/data_sources/products_ds.dart';
import 'package:clean_architecture/data_layer/models/product_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductsDS>()])
void main() {
  group(
    'In ProductsRepository',
    () {
      group(
        'Should return ProductResponseEntity',
        () {
          test(
            'when client response was 200 and has valid data',
            () async {
              final mockProductDS = MockProductsDS();

              // //faking the data using mockito
              when(
                 mockProductDS.fetchProducts(),
              ).thenAnswer(
                (realInvocation) => Future.value(
                  ProductResponseModel.fromJson(fakeData),
                ),
              );

              // //it hits real database
              final result =
                  await mockProductDS.fetchProducts(); //return ProductResponseModel

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

