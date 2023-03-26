abstract class SingInEvent {}


class SingInTextChangedEvent extends SingInEvent {
  late final String emailValue;
  late final String passwordValue;
  SingInTextChangedEvent(this.emailValue,this.passwordValue);
}


class SingInSubmittedEvent extends SingInEvent {
  late final String email;
  late final String password;
  SingInSubmittedEvent(this.email,this.password);
}