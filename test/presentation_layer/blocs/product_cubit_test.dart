import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture/data_layer/models/product_response_model.dart';
import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/domain_layer/usecases/fetch_products_uc.dart';
import 'package:clean_architecture/presentation_layer/bloc/product/product_cubit.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchProductsUC>()])
void main() {
  group(
    'Product Cubit',
    () {
      blocTest(
        'fetching product details expecting product Enitity',
        build: () => ProductCubit(),
        act: (ProductCubit cubit) {
          //logic
          final mockFetchProductsUC = MockFetchProductsUC();

          when(
            mockFetchProductsUC.execute(),
          ).thenAnswer(
            (realInvocation) => Future.value(
              Right(ProductResponseModel.fromJson(fakeData)),
            ),
          );

          cubit.fetchProducts();
        },
        expect: () => [
          ProductLoadingState(),
          ProductSuccessState(
            const ProductResponseEntity(
              data: [],
            ),
          )
        ],
        wait: const Duration(seconds: 10),
      );

      blocTest(
        'fetching product details expecting to handle error',
        build: () => ProductCubit(),
        act: (ProductCubit cubit) => cubit.fetchProducts(),
        expect: () => [
          ProductLoadingState(),
          ProductFailureState(),
        ],
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
