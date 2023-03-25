import 'dart:async';

import 'package:bloc_state_management_in_flutter_using/blocs/internet%20bloc/internet_event.dart';
import 'package:bloc_state_management_in_flutter_using/blocs/internet%20bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{

Connectivity connectivity = Connectivity();
StreamSubscription? connectivityStreamSubscription;

  
  InternetBloc(): super(InternetInitialState()){

    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
     
     connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((result) {
        
        if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
             add(InternetGainedEvent());
        }else{
            add(InternetLostEvent());
        }
        
     });
    
  }



@override
  Future<void> close() {
    // TODO: implement close
    connectivityStreamSubscription?.cancel();
    return super.close();
  }


  
}