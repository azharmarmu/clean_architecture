import 'package:clean_architecture/core/app_api.dart';
import 'package:clean_architecture/data_layer/data_sources/products_ds.dart';
import 'package:clean_architecture/data_layer/models/product_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_ds_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group(
    'In ProductsDS',
    () {
      group(
        'Should return ProductResponseModel',
        () {
          test(
            'when client response was 200 and has valid data',
            () async {
              final mockDio = MockDio();

              final client = ApiClient(dio: mockDio);
              final productDS = ProductsDSImpl(client: client);

              //faking the data using mockito
              when(
                mockDio.get(ApiClient.fetchProducts),
              ).thenAnswer(
                (realInvocation) => Future.value(
                  Response(
                    requestOptions: RequestOptions(),
                    data: fakeData,
                    statusCode: 200,
                  ),
                ),
              );

              //it hits real database
              final result =
                  await productDS.fetchProducts(); //return ProductResponseModel

              expect(
                result,
                ProductResponseModel.fromJson(
                  fakeData,
                ),
              );
            },
          );

          // test(
          //   'when client response was 200 and has no data',
          //   () {},
          // );
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
