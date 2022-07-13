import 'package:shared_preferences/shared_preferences.dart';

class ReadSharedPref {
  Future<String?> read(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key.toString());
  }
}
