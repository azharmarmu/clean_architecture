import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain_layer/entities/request/counter_request.dart';
import 'package:clean_architecture/domain_layer/entities/response/counter_entity.dart';
import 'package:clean_architecture/domain_layer/usecases/counter_usecase.dart';
import 'package:meta/meta.dart';

class Counter2Cubit extends Cubit<CounterEntity> {
  final CounterUC counterUC = CounterUC(); //composition
  CounterRequest request = const CounterRequest(value: 0);

  Counter2Cubit() : super(const CounterEntity(value: 0));

  void functionAdd() {
    final response = counterUC.addFunction(request);
    request = CounterRequest(value: response.value);
    emit(response);
  }

  void functionSub() {
    final response = counterUC.addFunction(request);
    request = CounterRequest(value: response.value);
    emit(response);
  }
}
