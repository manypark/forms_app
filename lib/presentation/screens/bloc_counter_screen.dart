import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(), 
        child: const _BlocCounterView()
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy( value );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Bloc Counter: ${state.transactionCount}');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            // onPressed: () => context.read<CounterBloc>().add( CounterReset() ),
            onPressed: () => context.read<CounterBloc>().resetCounter(),
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) => Text(
            'Counter value: ${counterBloc.state.counter}',
            style: const TextStyle(fontSize: 24))),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context, 1),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
