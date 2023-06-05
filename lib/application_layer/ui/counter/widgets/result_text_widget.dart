import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubit/counter2_cubit.dart';

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //var _cubit = Counter2Cubit();
    //var _cubit = BlocProvider.of<Counter2Cubit>(context);
    var _cubit = context.read<Counter2Cubit>();
    return BlocBuilder(
      bloc: _cubit,
      builder: (context, state) {
        return Text(
          'Result: $state', //dynamic
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
