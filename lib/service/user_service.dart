import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static final String _usernamekey="username";
  static final String _passwordkey="password";
  static final String _islogin="islogin";

   Future<void> saveuserdata({required String username,required String password,}) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(_usernamekey, username);
    pref.setString(_passwordkey, password);
    pref.setBool(_islogin, true);
  }
  Future<String?> getusername() async {
    final pref=await SharedPreferences.getInstance();
    if(pref.containsKey(_usernamekey)){
      return pref.getString(_usernamekey);
    }
    return null;
  }
 Future<bool?> isLoggedin() async {
    final pref=await SharedPreferences.getInstance();
    if(pref.containsKey(_islogin)){
      return pref.getBool(_islogin);
    }else{
      return false;
    }
  }
  Future<void>logout() async {
        final pref=await SharedPreferences.getInstance();
           pref.clear();
  }
}