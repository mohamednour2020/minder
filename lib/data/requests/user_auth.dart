import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:minder/domain/user_model.dart';

import '../../domain/data_source/user_data_source.dart';
import '../../domain/data_source/validation_source.dart';
import '../../domain/model_response/user_auth_error_response.dart';
import '../consts.dart';

class UserAuthRequests{
  static login({required String userName ,
    required String password ,
    required Function
    onSuccess,required Function(String error) onError})async{
    try {
      //API Calling

      String token = await getToken();
      var headers = {"Authorization" : token, ...apiHeaders};

      await http.post(
          getUri(USER_LOGIN),
          headers: headers,
          body: json.encode({
            "username": userName,
            "password": password,
          })
      ).then((response) async{
        Map<String, dynamic> decoded;
        log(response.body + "\n" + response.statusCode.toString());
        // modiling
        if (isValidResponse(response.statusCode)) {
          log(response.body);
          decoded = json.decode(response.body);
          await setToken(token: decoded['data']['access_token'],type: "office");
          await setUser(UserModel.fromJson(decoded['data']));
          onSuccess();
          // if(decoded['status']){
          //   UserLoginResponse user = UserLoginResponse.fromJson(decoded);
          //
          //   user.data.user== null ?
          //   setUser(user.data.showroom)
          //       :
          //   setUser(user.data.user);
          //   onSuccess(user);
          // }
          // else {
          //   onError(decoded['message']);
          // }
        }
        else {
          log(response.body);
          UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(json.decode(response.body));
          if (error.errors!=null){
            onError(
                error.errors!.userName.isNotEmpty
                    ?
                error.errors!.userName.first
                    :
                error.errors!.office.isNotEmpty
                    ?
                error.errors!.office.first
                    :
                error.errors!.password.isNotEmpty
                    ?
                error.errors!.password.first
                    :
                error.errors!.error.isNotEmpty
                    ?
                error.errors!.error.first
                    :
                ""
            );
          }
        }
        // Debugging API response
        debugApi(
            methodName: "login",
            statusCode: response.statusCode,
            response: response.body,
            data: {
              "username": userName,
              "password": password,
            },
            endPoint: response.request!.url.toString(),
            headers: headers);
      }, onError: (error) {
        log("error happened from Login ${error.toString()}");
        onError(error.toString());
      });
    }catch(e){
      log("error happened from Login ${e.toString()}");
      onError(e.toString());
    }
  }

  // static register(UserRegisterSendModel registerData,{
  //   required Function
  //   onSuccess,required Function(String error) onError})async{
  //   try {
  //     //API Calling
  //     String lang = await getLanguage();
  //     String token = await getToken();
  //     var headers = {"Accept-Language": lang,"Authorization" : token, ...apiHeaders};
  //     await http.post(
  //         getUri(USER_REGISTER),
  //         headers: headers,
  //         body: registerData.toJson()
  //     ).then((response) {
  //       Map<String, dynamic> decoded;
  //       log(response.body + "\n" + response.statusCode.toString());
  //       // modiling
  //       if (isValidResponse(response.statusCode)) {
  //         log(response.body);
  //         decoded = json.decode(response.body);
  //         setToken(token: decoded['data']['token'],type: "office");
  //         onSuccess();
  //         // if(decoded['status']){
  //         //   UserLoginResponse user = UserLoginResponse.fromJson(decoded);
  //         //
  //         //   user.data.user== null ?
  //         //   setUser(user.data.showroom)
  //         //       :
  //         //   setUser(user.data.user);
  //         //   onSuccess(user);
  //         // }
  //         // else {
  //         //   onError(decoded['message']);
  //         // }
  //       }
  //       else {
  //         log(response.body);
  //         UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(json.decode(response.body));
  //         if (error.errors!=null){
  //           onError(
  //               error.errors!.company.isNotEmpty
  //                   ?
  //               error.errors!.company.first
  //                   :
  //               error.errors!.office.isNotEmpty
  //                   ?
  //               error.errors!.office.first
  //                   :
  //               error.errors!.password.isNotEmpty
  //                   ?
  //               error.errors!.password.first
  //                   :
  //               error.errors!.error.isNotEmpty
  //                   ?
  //               error.errors!.error.first
  //                   :
  //               error.errors!.passwordConfirmation.isNotEmpty
  //                   ?
  //               error.errors!.passwordConfirmation.first
  //                   :
  //               error.errors!.managerName.isNotEmpty
  //                   ?
  //               error.errors!.managerName.first
  //                   :
  //               error.errors!.number.isNotEmpty
  //                   ?
  //               error.errors!.number.first
  //                   :
  //               error.errors!.phone.isNotEmpty
  //                   ?
  //               error.errors!.phone.first
  //                   :
  //               ""
  //           );
  //         }
  //       }
  //       // Debugging API response
  //       debugApi(
  //           methodName: "login",
  //           statusCode: response.statusCode,
  //           response: response.body,
  //           data: registerData.toJson(),
  //           endPoint: response.request!.url.toString(),
  //           headers: headers);
  //     }, onError: (error) {
  //       log("error happened from Login ${error.toString()}");
  //       onError(error.toString());
  //     });
  //   }catch(e){
  //     log("error happened from Login ${e.toString()}");
  //     onError(e.toString());
  //   }
  // }
  //
  //
  // static void logout({required Function onSuccess, required Function(String error) onError}) async {
  //   //API Calling
  //   String lang = await getLanguage();
  //   String token = await getToken();
  //   var headers = {"Accept-Language": lang,"Authorization" : token, ...apiHeaders};
  //   await http.post(
  //     Uri.parse(USER_LOGOUT),
  //     headers: headers ,).then((response) {
  //     Map<String, dynamic> decoded = {};
  //     // modiling
  //     if (isValidResponse(response.statusCode) ) {
  //       decoded = json.decode(response.body);
  //       if(decoded['errors']==null){
  //         userLogout();
  //         onSuccess();
  //       }else
  //       {
  //         onError("خطأ فى تسجيل الحروج ${response.statusCode}");
  //       }
  //     }
  //     else {
  //       // AuthError error = AuthError.fromJson(decoded);
  //       onError("خطأ فى تسجيل الحروج ${response.statusCode}");
  //     }
  //     // Debugging API response
  //     debugApi(
  //         methodName: "logout",
  //         statusCode: response.statusCode,
  //         response: decoded,
  //         data:  null,
  //         endPoint: response.request!.url.toString(),
  //         headers: headers);
  //   },onError: (error){
  //     log("error happened from Logout ${error.toString()}");
  //   });
  //   // Decoding Response.
  //
  // }
  //
  // static changePassword({required String currentPassword ,
  //   required String newPassword ,required String newPasswordConfirm ,
  //   required Function(String msg) onSuccess,required Function(String error) onError})async{
  //   try {
  //     //API Calling
  //     String lang = await getLanguage();
  //     String token = await getToken();
  //     var headers = {"Accept-Language": lang,"Authorization" : token, ...apiHeaders};
  //
  //     await http.post(
  //         getUri(OFFICE_CHANGE_PASSWORD),
  //         headers: headers,
  //         body: json.encode({
  //           "_method":"patch",
  //           "current_password": currentPassword,
  //           "password": newPassword,
  //           "password_confirmation": newPasswordConfirm,
  //         })
  //     ).then((response) async{
  //       Map<String, dynamic> decoded;
  //       // log(response.body + "\n" + response.statusCode.toString());
  //       // modiling
  //       if (isValidResponse(response.statusCode)) {
  //         log(response.body);
  //         decoded = json.decode(response.body);
  //         if(decoded['errors']==null){
  //           onSuccess("تم تغير كلمة السر بنجاح");
  //         }
  //         else{
  //           log(response.body);
  //           UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(json.decode(response.body));
  //           if (error.errors!=null){
  //             onError(
  //                 error.errors!.company.isNotEmpty
  //                     ?
  //                 error.errors!.company.first
  //                     :
  //                 error.errors!.office.isNotEmpty
  //                     ?
  //                 error.errors!.office.first
  //                     :
  //                 error.errors!.password.isNotEmpty
  //                     ?
  //                 error.errors!.password.first
  //                     :
  //                 error.errors!.error.isNotEmpty
  //                     ?
  //                 error.errors!.error.first
  //                     :
  //                 ""
  //             );
  //           }
  //         }
  //
  //         // if(decoded['status']){
  //         //   UserLoginResponse user = UserLoginResponse.fromJson(decoded);
  //         //
  //         //   user.data.user== null ?
  //         //   setUser(user.data.showroom)
  //         //       :
  //         //   setUser(user.data.user);
  //         //   onSuccess(user);
  //         // }
  //         // else {
  //         //   onError(decoded['message']);
  //         // }
  //       }
  //       else {
  //         log(response.body);
  //         UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(json.decode(response.body));
  //         if (error.errors!=null){
  //           onError(
  //               error.errors!.company.isNotEmpty
  //                   ?
  //               error.errors!.company.first
  //                   :
  //               error.errors!.office.isNotEmpty
  //                   ?
  //               error.errors!.office.first
  //                   :
  //               error.errors!.password.isNotEmpty
  //                   ?
  //               error.errors!.password.first
  //                   :
  //               error.errors!.error.isNotEmpty
  //                   ?
  //               error.errors!.error.first
  //                   :
  //               ""
  //           );
  //         }
  //       }
  //       // Debugging API response
  //       debugApi(
  //           methodName: "login",
  //           statusCode: response.statusCode,
  //           response: response.body,
  //           data: {
  //             "password": newPassword,
  //             "current_password": currentPassword,
  //             "password_confirmation": newPasswordConfirm,
  //           },
  //           endPoint: response.request!.url.toString(),
  //           headers: headers);
  //     }, onError: (error) {
  //       log("error happened from Login ${error.toString()}");
  //       onError(error.toString());
  //     });
  //   }catch(e){
  //     log("error happened from Login ${e.toString()}");
  //     onError(e.toString());
  //   }
  // }
  //
  // static sendVerificationCode({required String phoneNumber ,
  //   required Function onSuccess,required Function(String error) onError})async{
  //   try {
  //     //API Calling
  //     String lang = await getLanguage();
  //     String token = await getToken();
  //     var headers = {"Accept-Language": lang,"Authorization" : token, ...apiHeaders};
  //
  //     await http.post(
  //         getUri(SEND_VERIFICATION_CODE),
  //         headers: headers,
  //         body: json.encode({
  //           "phone": phoneNumber,
  //         })
  //     ).then((response) async{
  //       Map<String, dynamic> decoded;
  //       // log(response.body + "\n" + response.statusCode.toString());
  //       // modiling
  //       if (isValidResponse(response.statusCode)) {
  //         log(response.body);
  //         decoded = json.decode(response.body);
  //         if (decoded['errors'] == null) {
  //           onSuccess();
  //         }
  //         else {
  //           log(response.body);
  //           UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(
  //               json.decode(response.body));
  //           if (error.errors != null) {
  //             onError(
  //                 error.errors!.phone.isNotEmpty
  //                     ?
  //                 error.errors!.phone.first
  //                     :
  //                 error.errors!.code.isNotEmpty
  //                     ?
  //                 error.errors!.code.first
  //                     :
  //                 error.errors!.password.isNotEmpty
  //                     ?
  //                 error.errors!.password.first
  //                     :
  //                 error.errors!.passwordConfirmation.isNotEmpty
  //                     ?
  //                 error.errors!.passwordConfirmation.first
  //                     :
  //                 error.errors!.error.isNotEmpty
  //                     ?
  //                 error.errors!.error.first
  //                     :
  //                 ""
  //             );
  //           }
  //
  //           // if(decoded['status']){
  //           //   UserLoginResponse user = UserLoginResponse.fromJson(decoded);
  //           //
  //           //   user.data.user== null ?
  //           //   setUser(user.data.showroom)
  //           //       :
  //           //   setUser(user.data.user);
  //           //   onSuccess(user);
  //           // }
  //           // else {
  //           //   onError(decoded['message']);
  //           // }
  //         }
  //       }
  //       else {
  //         log(response.body);
  //         UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(json.decode(response.body));
  //         if (error.errors!=null){
  //           onError(
  //               error.errors!.phone.isNotEmpty
  //                   ?
  //               error.errors!.phone.first
  //                   :
  //               error.errors!.code.isNotEmpty
  //                   ?
  //               error.errors!.code.first
  //                   :
  //               error.errors!.password.isNotEmpty
  //                   ?
  //               error.errors!.password.first
  //                   :
  //               error.errors!.passwordConfirmation.isNotEmpty
  //                   ?
  //               error.errors!.passwordConfirmation.first
  //                   :
  //               error.errors!.error.isNotEmpty
  //                   ?
  //               error.errors!.error.first
  //                   :
  //               ""
  //           );
  //         }
  //       }
  //       // Debugging API response
  //       debugApi(
  //           methodName: "sendVerificationCode",
  //           statusCode: response.statusCode,
  //           response: response.body,
  //           data: {
  //             "phone": phoneNumber,
  //           },
  //           endPoint: response.request!.url.toString(),
  //           headers: headers);
  //     }, onError: (error) {
  //       log("error happened from sendVerificationCode ${error.toString()}");
  //       onError(error.toString());
  //     });
  //   }catch(e){
  //     log("error happened from sendVerificationCode ${e.toString()}");
  //     onError(e.toString());
  //   }
  // }
  //
  // static resetPassword({required String phoneNumber ,required String code ,required String password ,required String passwordConfirm,
  //   required Function onSuccess,required Function(String error) onError})async{
  //   try {
  //     //API Calling
  //     String lang = await getLanguage();
  //     String token = await getToken();
  //     var headers = {"Accept-Language": lang,"Authorization" : token, ...apiHeaders};
  //
  //     await http.post(
  //         getUri(RESET_PASSWORD),
  //         headers: headers,
  //         body: json.encode({
  //           "phone": phoneNumber,
  //           "code": code,
  //           "password": password,
  //           "password_confirmation": passwordConfirm,
  //         })
  //     ).then((response) async{
  //       Map<String, dynamic> decoded;
  //       // log(response.body + "\n" + response.statusCode.toString());
  //       // modiling
  //       if (isValidResponse(response.statusCode)) {
  //         log(response.body);
  //         decoded = json.decode(response.body);
  //         if (decoded['errors'] == null) {
  //           onSuccess();
  //         }
  //         else {
  //           log(response.body);
  //           UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(
  //               json.decode(response.body));
  //           if (error.errors != null) {
  //             onError(
  //                 error.errors!.phone.isNotEmpty
  //                     ?
  //                 error.errors!.phone.first
  //                     :
  //                 error.errors!.code.isNotEmpty
  //                     ?
  //                 error.errors!.code.first
  //                     :
  //                 error.errors!.password.isNotEmpty
  //                     ?
  //                 error.errors!.password.first
  //                     :
  //                 error.errors!.passwordConfirmation.isNotEmpty
  //                     ?
  //                 error.errors!.passwordConfirmation.first
  //                     :
  //                 error.errors!.error.isNotEmpty
  //                     ?
  //                 error.errors!.error.first
  //                     :
  //                 ""
  //             );
  //           }
  //
  //           // if(decoded['status']){
  //           //   UserLoginResponse user = UserLoginResponse.fromJson(decoded);
  //           //
  //           //   user.data.user== null ?
  //           //   setUser(user.data.showroom)
  //           //       :
  //           //   setUser(user.data.user);
  //           //   onSuccess(user);
  //           // }
  //           // else {
  //           //   onError(decoded['message']);
  //           // }
  //         }
  //       }
  //       else {
  //         log(response.body);
  //         UserAuthErrorResponse error = UserAuthErrorResponse.fromJson(json.decode(response.body));
  //         if (error.errors!=null){
  //           onError(
  //               error.errors!.phone.isNotEmpty
  //                   ?
  //               error.errors!.phone.first
  //                   :
  //               error.errors!.code.isNotEmpty
  //                   ?
  //               error.errors!.code.first
  //                   :
  //               error.errors!.password.isNotEmpty
  //                   ?
  //               error.errors!.password.first
  //                   :
  //               error.errors!.passwordConfirmation.isNotEmpty
  //                   ?
  //               error.errors!.passwordConfirmation.first
  //                   :
  //               error.errors!.error.isNotEmpty
  //                   ?
  //               error.errors!.error.first
  //                   :
  //               ""
  //           );
  //         }
  //       }
  //       // Debugging API response
  //       debugApi(
  //           methodName: "sendVerificationCode",
  //           statusCode: response.statusCode,
  //           response: response.body,
  //           data: {
  //             "phone": phoneNumber,
  //           },
  //           endPoint: response.request!.url.toString(),
  //           headers: headers);
  //     }, onError: (error) {
  //       log("error happened from sendVerificationCode ${error.toString()}");
  //       onError(error.toString());
  //     });
  //   }catch(e){
  //     log("error happened from sendVerificationCode ${e.toString()}");
  //     onError(e.toString());
  //   }
  // }
}