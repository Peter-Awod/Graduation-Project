import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }



// in login i will use setUserID method
  static Future<bool> setUserID({
  //'userID'
    required String key,
    required int value,
})async
  {
    return await sharedPreferences!.setInt(key, value);
  }

// in user info and update info i will use getUserID method


  static int? getUserID({
    //'userID'
    required String key,
})
  {
    return sharedPreferences!.getInt(key);
  }


  // in settings will use remove method to logout

static removeUserId({required String key})async{
    return await sharedPreferences!.remove(key);
}

}