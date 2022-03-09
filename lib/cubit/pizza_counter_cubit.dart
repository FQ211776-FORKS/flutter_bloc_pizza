import 'package:bloc/bloc.dart';

class PizzaCounterCubit extends Cubit<int> {
  PizzaCounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => state > 0 ? emit(state - 1) : emit(state);
}
