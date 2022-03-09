import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pizza/blocs/pizza_counter/pizza_bloc.dart';
import 'package:flutter_bloc_pizza/models/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PizzaBloc()
            ..add(
              LoadPizzaCounter(),
            ),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter BloC Pattern',
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Counter with BloC'),
        backgroundColor: Colors.orange[800],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaLoading) {
              return const CircularProgressIndicator(color: Colors.orange);
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.pizzas.length}',
                    style: const TextStyle(fontSize: 45),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.pizzas.length;
                            index++)
                          Positioned(
                            left: random.nextInt(400).toDouble(),
                            top: random.nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: state.pizzas[index].image,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.local_pizza),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.local_pizza_outlined),
            backgroundColor: Colors.orange[500],
            onPressed: () {
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
            },
          ),
          // FloatingActionButton(
          //   child: const Icon(Icons.local_pizza_outlined),
          //   backgroundColor: Colors.orange[500],
          //   onPressed: () {
          //     context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
          //   },
          // ),
        ],
      ),
    );
  }
}
