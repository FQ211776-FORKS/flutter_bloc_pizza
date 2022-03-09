part of 'pizza_counter_cubit.dart';

class PizzaCounterState extends Equatable {
  final List<Pizza> pizzas;

  const PizzaCounterState({
    required this.pizzas,
  });

  factory PizzaCounterState.initial() {
    return const PizzaCounterState(pizzas: <Pizza>[]);
  }

  PizzaCounterState copyWith({
    List<Pizza>? pizzas,
  }) {
    return PizzaCounterState(pizzas: pizzas ?? this.pizzas);
  }

  @override
  List<Object> get props => [pizzas];
}
