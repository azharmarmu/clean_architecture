import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());

  void fetchProducts() {
    emit(ProductLoadingState());
    // var result = FetchProductsUC(); // this will take time
    // //if result is success
    // emit(ProductSuccessState());
    // //else result is error
    // emit(ProductFailureState());
  }
}
