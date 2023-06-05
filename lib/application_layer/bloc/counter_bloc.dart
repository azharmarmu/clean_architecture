import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_bloc_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  int counter = 0;
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event is CounterAddEvent) {
        counter++;
        emit(counter);
      } else if (event is CounterSubEvent) {
        counter--;
        emit(counter);
      }
    });
  }
}
