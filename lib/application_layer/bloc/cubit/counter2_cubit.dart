import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class Counter2Cubit extends Cubit<int> {
  int counter = 0;
  Counter2Cubit() : super(0);

  void functionAdd() {
    counter++;
    emit(counter);
  }

  void functionSub() {
    counter--;
    emit(counter);
  }
}
