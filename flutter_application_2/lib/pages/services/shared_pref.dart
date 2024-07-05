import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper{
 static String userIDkey = "USERKEY";
  static String usernamekey = "USERNAMEKEY";
  static String useremailkey = "USEREMAILKEY";
  static String userwalletkey = "USERWALLLETKEY";
  Future<bool>saveuserid(String getUserid)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userIDkey, getUserid);
  }
   Future<bool>saveusername(String getUsername)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(usernamekey, getUsername);
  }
   Future<bool>saveuseremail(String getUseremail)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(useremailkey, getUseremail);
  }
   Future<bool>saveuserwallet(String getUserwallet)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userwalletkey, getUserwallet);
  }
  Future<String?> getUserid()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userIDkey);
  }
   Future<String?> getUsername()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(usernamekey);
  }
   Future<String?> getUseremail()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(useremailkey);
  }
   Future<String?> getUserwallet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userwalletkey);
  }
}