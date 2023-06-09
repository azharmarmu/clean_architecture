import 'package:clean_architecture/domain_layer/entities/request/counter_request.dart';
import 'package:clean_architecture/domain_layer/entities/response/counter_entity.dart';

class CounterUC {
  CounterEntity addFunction(CounterRequest request) =>
      CounterEntity(value: request.value + 1);

  CounterEntity subFunction(CounterRequest request) {
    return CounterEntity(value: request.value - 1);
  }
}
