import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../block/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Codegen'),
      ),
      body: const Center(
        child: _CounterText(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBlock>(context)
                .add(CounterEvent.increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBlock>().add(CounterEvent.reset()),
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBlock>().state;
    return state.when(
        initial: () => FlutterLogo(size: 120),
        loading: () => CircularProgressIndicator(),
        loaded: (counter) => Text('${counter}',
            style: Theme.of(context).textTheme.headline2));
    // if (state is CounterStartEvent) {
    //   return FlutterLogo(size: 120);
    // } else if (state is CounterLoadingState) {
    //   return CircularProgressIndicator();
    // } else if (state is CounterLoadedState) {
    //   return Text('${state.counter}', style: Theme.of(context).textTheme.headline2);
    // }
    // return SizedBox.shrink();
  }
}
