
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {Initial , Lost , Gained}



class InternetCubit extends Cubit<InternetState>{
    Connectivity connectivity = Connectivity();
   StreamSubscription? connectivityStreamSubscription;

   InternetCubit():super(InternetState.Initial){
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((result) {
        
        if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
             emit(InternetState.Gained);
        }else{
            emit(InternetState.Lost);
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