import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/bloc/sign_in_event.dart';
import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SingInEvent,SingInState>{
   SignInBloc():super(SignInInitialState()){

     on<SingInTextChangedEvent>((event, emit) {

        if(EmailValidator.validate(event.emailValue) == false){

            emit(SignInErrorState("Please enter a valid email address"));

        }else if(event.passwordValue.length <8 ){

            emit(SignInErrorState("Please enter a valid password"));

        }else{

          emit(SignInValidState());

        }

     });


     on<SingInSubmittedEvent>((event, emit) {
         emit(SignInLoadingState());
     });


     
       
   }



}