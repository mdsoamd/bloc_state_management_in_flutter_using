import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                child: Text("Sign In"),
                onPressed: () {
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(

                          builder: ((context) => BlocProvider(
                                create: (context) => SignInBloc(),
                                child: SignInScreen(),
                              ))));

                              
                },
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
