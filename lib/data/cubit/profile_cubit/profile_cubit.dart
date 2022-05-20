// import 'dart:developer';
// import 'dart:io';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meta/meta.dart';
// import 'package:saber/data/data_source/validation_source.dart';
// import 'package:saber/data/firebase_services/firebase_user_info.dart';
// import 'package:saber/domain/models/firebase_user_model.dart';
//
// part 'profile_state.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileInitial());
//   static ProfileCubit get(context) => BlocProvider.of(context);
//   static FirebaseUserModel? userModel ;
//   getUserInfo(){
//     emit(ProfileLoading());
//     FirebaseUserInfo.getUser(
//       onSuccess: (user){
//         userModel = user;
//         log(user.firebaseId??"");
//         emit(ProfileLoaded(user));
//       },
//       onError: (msg){
//         emit(ProfileError(msg));
//       },
//     );
//   }
//
//   updateUserInfo(FirebaseUserModel user){
//     if(validatePhoneNumber(user.phone!)){
//       emit(ProfileError("برجاء التأكد من ادخل رقم هاتف سعودى صحيح"));
//     }
//     else{
//       emit(ProfileUpdateLoading());
//       FirebaseUserInfo.updateUser(
//         user,
//         onSuccess: (user){
//           log(user.firebaseId??"");
//           userModel = user;
//           emit(ProfileLoaded(user));
//         },
//         onError: (msg){
//           emit(ProfileError(msg));
//         },
//       );
//     }
//
//   }
//
//   updateUserImage(FirebaseUserModel userModel)async{
//     final ImagePicker _picker = ImagePicker();
//     try {
//       final pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery,
//       );
//       if (pickedFile != null) {
//         emit(ProfileLoading());
//         FirebaseUserInfo.updateUserImage(
//           File(pickedFile.path),pickedFile.name,userModel,
//           onSuccess: (user){
//             emit(ProfileLoaded(user));
//           },
//           onError: (msg){
//             emit(ProfileError(msg));
//           },
//         );
//       }
//     } catch (e) {
//       log("Image picker error " + e.toString());
//     }
//   }
//
// emitLoaded(){
//     emit(ProfileLoaded(userModel!));
// }
//
// }
