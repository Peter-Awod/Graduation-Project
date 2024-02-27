abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppChangePasswordSuffixIconState extends AppStates{}
class AppChangeConfirmPasswordSuffixIconState extends AppStates{}
class AppSelectGenderState extends AppStates{}
class AppOnBoardingPageIndexState extends AppStates{}

class AppCreateDatabaseState extends AppStates{}
class AppOpenDatabaseState extends AppStates{}

class AppInsertDatabaseSuccessState extends AppStates{}
class AppInsertDatabaseLoadingState extends AppStates{}
class AppInsertDatabaseFailedState extends AppStates{
  final String error;
  AppInsertDatabaseFailedState(this.error);
}

class AppLoginLoadingState extends AppStates {}
class AppLoginSuccessState extends AppStates {}
class AppLoginFailedState extends AppStates {
  final String error;
  AppLoginFailedState(this.error);
}

class UpdateScreenOpenedState extends AppStates {}
class UpdateUserDataInDataBaseState extends AppStates {}


class GetUserInformationLoadingState extends AppStates {}
class GetUserInformationSuccessState extends AppStates {}
class GetUserInformationFailedState extends AppStates {
  final String error;
  GetUserInformationFailedState(this.error);
}

