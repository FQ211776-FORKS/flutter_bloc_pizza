import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pizza/models/pizza.dart';

part 'pizza_counter_state.dart';

class PizzaCounterCubit extends Cubit<PizzaCounterState> {
  PizzaCounterCubit() : super(PizzaCounterState.initial());

  void increment(Pizza pizza) {
    emit(
      state.copyWith(
        pizzas: List.from(state.pizzas)..add(pizza),
      ),
    );
  }

  void decrement(Pizza pizza) {
    emit(
      state.copyWith(
        pizzas: List.from(state.pizzas)..remove(pizza),
      ),
    );
  }
}
