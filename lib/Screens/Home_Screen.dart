import 'package:bloc_state_management_in_flutter_using/cubits/Internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Center(
             child: BlocConsumer<InternetCubit, InternetState>(
             listener: (context, state) {
          
               if(state == InternetState.Gained){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Connected!"),
                      backgroundColor: Colors.green,
                     
                     )
                  );
                
                     
                  }else if(state == InternetState.Lost){
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Not Connected!"),
                      backgroundColor: Colors.red,
                     )
                  );
                  }
          
        },

        builder: (context, state) {
                if(state == InternetState.Gained){
                     return Text("Connected!");
                  }else if(state == InternetState.Lost){
                     return Text("Not Connected!");
                  }else{
                     return Text("Loading...");
                  }

        },
      )




              // BlocBuilder<InternetBloc, InternetState>(     //* <-- only UI Show
              //   builder: (context, state) {

              //     if(state is InternetGainedState){
              //        return Text("Connected!");
              //     }else if(state is InternetLostState){
              //        return Text("Not Connected!");
              //     }else{
              //        return Text("Loading...");
              //     }

              //   },
              // ),






              )),
    );
  }
}
