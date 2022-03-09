import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pizza/cubit/pizza_counter_cubit.dart';

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
          create: (context) => PizzaCounterCubit(),
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
        child: BlocBuilder<PizzaCounterCubit, int>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$state',
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
                      for (int index = 0; index < state; index++)
                        Positioned(
                          left: random.nextInt(400).toDouble(),
                          top: random.nextInt(400).toDouble(),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/pizza.png'),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            );
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
              context.read<PizzaCounterCubit>().increment();
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read<PizzaCounterCubit>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
