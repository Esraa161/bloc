import 'package:bloc_api/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(onPressed: (){
          BlocProvider.of<CounterBloc>(context).add(IncreamentEvent());
        },
            child: Icon(Icons.add),),
        SizedBox(width: 10,),
        FloatingActionButton(onPressed: (){
          BlocProvider.of<CounterBloc>(context).add(RestEvent());
        },
          child: Icon(Icons.exposure_zero),),
        SizedBox(width: 10,),
        FloatingActionButton(onPressed: (){
          BlocProvider.of<CounterBloc>(context).add(DecreamentEvent());
        },
          child: Icon(Icons.remove),),
      ],
    );
  }
}
