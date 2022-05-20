part of 'login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class LoginInitial extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginLoaded extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginError extends UserLoginState {
  final String error;
  const LoginError(this.error);
  @override
  List<Object> get props => [];
}

class LoginUserSignedIn extends UserLoginState {
  @override
  List<Object> get props => [];
}

class LoginSendVerificationCodeLoading extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginSendVerificationCodeSuccess extends UserLoginState {
  @override
  List<Object> get props => [];
}

class LoginResetPasswordLoading extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginResetPasswordSuccess extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginResetPasswordError extends UserLoginState {
  final String error;
  const LoginResetPasswordError(this.error);
  @override
  List<Object> get props => [];
}