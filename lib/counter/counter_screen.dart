import 'package:bloc_api/counter/buttons%20widget.dart';
import 'package:bloc_api/counter/counter_bloc.dart';
import 'package:bloc_api/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text("Counter value is : ",
              style: TextStyle(
                  fontSize: 20
              ),),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if(state is CounterInitial){
                  return Text("0", style: TextStyle(
                    fontSize: 20
                ),);
                }else if(state is CounterValueChangedState){
                  return Text(state.counter.toString(), style: TextStyle(
                      fontSize: 20
                  ),);
                }else{
                  return SizedBox();
                }

              },
            )
          ],
        ),
      ),
      floatingActionButton: ButtonsWidget(),
    );
  }
}
