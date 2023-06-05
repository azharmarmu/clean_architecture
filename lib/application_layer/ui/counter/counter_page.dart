import 'package:clean_architecture/application_layer/bloc/cubit/counter2_cubit.dart';
import 'package:clean_architecture/application_layer/ui/counter/widgets/result_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  final _cubit = Counter2Cubit();

  CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = CounterBloc();

    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Architecture - Cubit'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              ResultTextWidget(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () {
                  //_bloc.add(CounterAddEvent());
                  // _cubit.functionAdd();
                  context.read<Counter2Cubit>().functionAdd();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () {
                // _bloc.add(CounterSubEvent());
                //_cubit.functionSub();
                context.read<Counter2Cubit>().functionSub();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
