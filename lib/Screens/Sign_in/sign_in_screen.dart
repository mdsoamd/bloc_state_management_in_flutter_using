import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/bloc/sign_in_event.dart';
import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);


 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In with Email",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          physics:BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [

            BlocBuilder<SignInBloc, SingInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),


            const SizedBox(
              height: 10,
            ),


            TextField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(
                    SingInTextChangedEvent(emailController.text,passwordController.text)
                );
              },
              decoration: InputDecoration(hintText: "Email Address"),
            ),


            const SizedBox(
              height: 10,
            ),



            TextField(
              controller: passwordController,
               onChanged: (value) {

                BlocProvider.of<SignInBloc>(context).add(
                    SingInTextChangedEvent(emailController.text,passwordController.text)
                );

              },
              decoration: InputDecoration(hintText: "Enter Password"),
            ),



            const SizedBox(
              height: 20,
            ),


            BlocBuilder<SignInBloc,SingInState>(
              builder: (context, state) {

                if(state is SignInLoadingState){
                  return Center(child: CircularProgressIndicator());
                }
                
                return CupertinoButton(
                    onPressed: () {

                      if(state is SignInValidState){
                         
                         BlocProvider.of<SignInBloc>(context).add(
                         SingInSubmittedEvent(emailController.text,passwordController.text)
                       );
                         
                      }
                      
                    },
                    
                    child: Text("Sign In"),
                    color: (state is SignInValidState) ? Colors.blue : Colors.grey,
                    
                    
                    );
              },
            )


          ],
        ),
      ),
    );
  }
}
