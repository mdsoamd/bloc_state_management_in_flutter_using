// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SingInState {}


class SignInInitialState extends SingInState {}


class SignInValidState extends SingInState {}


class SignInErrorState extends SingInState {
  late final String errorMessage;
  SignInErrorState(this.errorMessage,);
}


class SignInLoadingState extends SingInState {}
