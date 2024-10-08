import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
     if(event is ConnectedEvent){
       emit(ConnectedState(message: "Connected"));
     }
     else if (event is NotConnectedEvent){
       emit(NotConnectedState(message: "Not connected"));
     }
    });
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      for (var result in results) {
        if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {

          return add(ConnectedEvent());// Exit once connected
        }else{
          return add(NotConnectedEvent());
        }
      }

    });

  }
  @override
  Future<void> close() {
    _subscription?.cancel();
    // TODO: implement close
    return super.close();
  }
}
