import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture/domain_layer/entities/product_response_entity.dart';
import 'package:clean_architecture/presentation_layer/bloc/product/product_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Product Cubit',
    () {
      blocTest(
        'fetching product details expecting product Enitity',
        build: () => ProductCubit(),
        act: (ProductCubit cubit) => cubit.fetchProducts(),
        expect: () => [
          ProductLoadingState(),
          ProductSuccessState(
            const ProductResponseEntity(
              data: [],
            ),
          )
        ],
        wait: Duration(seconds: 10),
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
