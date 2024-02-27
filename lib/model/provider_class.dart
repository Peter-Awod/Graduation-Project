//
//
//
// import 'package:flutter/material.dart';
// import 'package:grad_project/class_helper.dart';
// import 'package:grad_project/model/database_helper.dart';
// import 'package:grad_project/shared/cubit/cubit.dart';
//
//
//
// class UserProvider with ChangeNotifier {
//   User? _user;
//
//   User? get user => _user;
//
//   void login(User user) {
//     _user = user;
//     notifyListeners();
//   }
//   void logout() {
//     _user = null;
//     notifyListeners();
//   }
//   void updateUserInfo(User updatedUser) {
//     _user = updatedUser;
//     notifyListeners();
//   }
//
//
//    updateUserInDatabase(User updatedUser,context) async {
//     final  AppCubit varCubit =AppCubit.get(context);
//      await varCubit.updateUser(updatedUser);
//
//
//   }
//
//
//
//
// }
//
