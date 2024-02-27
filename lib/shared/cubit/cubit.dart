import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/model/class_helper.dart';
import 'package:grad_project/modules/home_screen/home_screen.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:grad_project/shared/cubit/states.dart';
import 'package:grad_project/shared/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  bool isPasswordHide = true;
  bool isConfirmPasswordHide = true;

  String? gender;
  void changePasswordIconState(isPasswordHide) {
    this.isPasswordHide = !isPasswordHide;
    emit(AppChangePasswordSuffixIconState());
  }

  void changeConfirmIconState(isConfirmPasswordHide) {
    this.isConfirmPasswordHide = !isConfirmPasswordHide;
    emit(AppChangeConfirmPasswordSuffixIconState());
  }

  void selectGender(String gender)
  {
    this.gender=gender;
    emit(AppSelectGenderState());
  }


  bool onBoardingIndexChange(index){
    if (index==2)
      {
        emit(AppOnBoardingPageIndexState());
        return true;
      }
    else
      return false;
  }


  ///////////////////////////////

  late Database databaseVar;
  List<Map>userData=[];

  openUpdateScreen() {
    emit(UpdateScreenOpenedState());
  }

// Create database
  void initializeDatabase() {
    openDatabase('my_database.db', version: 1, onCreate: (databaseDb, version) {
      print('Database created');
      databaseDb
          .execute(
        'CREATE TABLE users(userId INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, gender TEXT ,phone TEXT ,birthday TEXT)',
      )
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('Error when creating table ${error.toString()}');
      });
    }, onOpen: (databaseDb) {
      print('Database opened');
      emit(AppOpenDatabaseState());
    }).then((value) {
      databaseVar = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertUserToDatabase(User user) async {
    emit(AppInsertDatabaseLoadingState());
    await databaseVar.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO users (name , email, password , gender , phone ,  birthday )'
              'VALUES ("${user.username}","${user.email}","${user.password}","${user.gender}","${user.phone}","${user.birthday}")')
          .then((value) {
        print('$value data added successfully');
        emit(AppInsertDatabaseSuccessState());

      }).catchError((error) {
        print('Error ${error.toString()}');
        emit(AppInsertDatabaseFailedState(error.toString()));
      });
      return null;
    });
  }

  loginUser({required BuildContext, required User logUser,required context}) async {
    emit(AppLoginLoadingState());
    await databaseVar.rawQuery(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [logUser.email, logUser.password],
    ).then((value) async {
      final List<Map<String, dynamic>> userData = await databaseVar.rawQuery(
        'SELECT * FROM users WHERE email = ? AND password = ?',
        [logUser.email, logUser.password],
      );
      final int userId = userData.first['userId'];


      CacheHelper.setUserID(key: 'userID', value: userId);
      emit(AppLoginSuccessState());
      int? userID =CacheHelper.getUserID(key: 'userID');
      print('UsserID: ${userID} :');
      pushReplacementNavigateTo(context, HomeScreen());
    }).catchError((error) {
      print('Error ${error.toString()}');
      emit(AppLoginFailedState(error.toString()));
      defaultSnackBarMessage(
          BuildContext: BuildContext,
          message: 'Invalid email or password',
          duration: 3);
    });
  }

  getUserInformation({required int userId})async
  {
    emit(GetUserInformationLoadingState());
    userData=[];
    await databaseVar.rawQuery(
      'SELECT * FROM users WHERE userId = ?',
      [userId],
    ).then((value) {
      userData.add(value.first);

      emit(GetUserInformationSuccessState());
      print(userData);
    }).catchError((error)
    {
      print('GET USER ERROR${error}');
      emit(GetUserInformationFailedState(error));
    });
  }

  updateUser({required User updatedUser}) async {
    await databaseVar.update(
      'users',
      {
        'name': updatedUser.username,
        'password': updatedUser.password,
        'email': updatedUser.email,
        'phone': updatedUser.phone,
        'gender': updatedUser.gender,
        'birthday': updatedUser.birthday,
      },
      where: 'userId = ?',
      whereArgs: [updatedUser.userId],
    ).then((value) {
      emit(UpdateUserDataInDataBaseState());
      print('updated user ${value}');
      getUserInformation(userId:updatedUser.userId);
    });
  }


}
