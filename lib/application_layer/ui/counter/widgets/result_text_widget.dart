import 'package:clean_architecture/domain_layer/entities/response/counter_entity.dart';
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
    return BlocBuilder<Counter2Cubit, CounterEntity>(
      bloc: _cubit,
      builder: (_, CounterEntity state) {
        return Text(
          'Result: ${state.value}', //dynamic
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
