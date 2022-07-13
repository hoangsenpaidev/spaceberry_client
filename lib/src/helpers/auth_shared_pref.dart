import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPref {
  Future<bool> setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString('token', token);
  }
}
