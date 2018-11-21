import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  int intData;
  String stringData;


  SharedPreferencesUtil();

  getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    intData = (prefs.getInt(key) ?? 0) ;
  }

  getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   stringData = (prefs.getString(key) ?? "") ;
    return this;
  }

  saveInt(String key, int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  saveString(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }



}