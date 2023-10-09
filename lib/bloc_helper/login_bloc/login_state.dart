part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginChangeObs extends LoginState {}
//================================LoginUser=================================//
class LoginUserSucc extends LoginState {
  final RepresentativeHome userHome;
  LoginUserSucc(this.userHome);
}
class LoginUserLoading extends LoginState {}
class LoginUserError extends LoginState {
  final String Error ;
  LoginUserError(this.Error);
}
//================================LoginUser=================================//