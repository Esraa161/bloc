import 'package:bloc_api/internet%20connection/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectionScreen extends StatelessWidget {
  String message = "connected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if(state is ConnectedState){
              return Text(
                state!.message!.toString(),
                style: TextStyle(fontSize: 20),
              );
            }else if(state is NotConnectedState){
              return Text(
                state!.message!.toString(),
                style: TextStyle(fontSize: 20),
              );
            }else{
              return SizedBox();
            }

          },
        ),
      ),
    );
  }
}

