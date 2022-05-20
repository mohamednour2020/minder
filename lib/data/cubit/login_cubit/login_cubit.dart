import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../requests/user_auth.dart';
part 'login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(LoginInitial());
  static UserLoginCubit get(context) => BlocProvider.of(context);
  List<String> companiesNames = [];
  int? companyId;

  userLogin(
      {
        required String userName,
        required String password}) {
    emit(LoginLoading());
    UserAuthRequests.login(
      userName: userName,

      password: password,
      onSuccess: () {
        emit(LoginUserSignedIn());
      },
      onError: (error) {
        log("from the cubit :: : : ::  \n $error");
        emit(LoginError(error));
      },
    );
  }

  emitInitial(){
    emit(LoginInitial());
  }

  // userSendVerificationCode(String phoneNumber){
  //   emit(LoginSendVerificationCodeLoading());
  //   UserAuthRequests.sendVerificationCode(
  //     phoneNumber: phoneNumber,
  //     onSuccess: () {
  //       emit(LoginSendVerificationCodeSuccess());
  //     },
  //     onError: (error) {
  //       log("from the cubit :: : : ::  \n $error");
  //       emit(LoginError(error));
  //     },
  //   );
  // }
  //
  // userResetPassword(String phoneNumber,String code,String password,String confirmPassword,){
  //   emit(LoginResetPasswordLoading());
  //   UserAuthRequests.resetPassword(
  //     phoneNumber: phoneNumber,
  //     code: code,
  //     password: password,
  //     passwordConfirm: confirmPassword,
  //     onSuccess: () {
  //       emit(LoginResetPasswordSuccess());
  //     },
  //     onError: (error) {
  //       log("from the cubit :: : : ::  \n $error");
  //       emit(LoginResetPasswordError(error));
  //     },
  //   );
  // }

}