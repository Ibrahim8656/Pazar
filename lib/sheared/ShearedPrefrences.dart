import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? shearedPrefrercne;
  static init() async {
    shearedPrefrercne = await SharedPreferences.getInstance();
  }

  static Future<bool> SaveData(String key, dynamic value) {
    if (value is String) return shearedPrefrercne!.setString(key, value);
    if (value is int) return shearedPrefrercne!.setInt(key, value);
    if (value is bool) return shearedPrefrercne!.setBool(key, value);
    return shearedPrefrercne!.setDouble(key, value);
  }

  static dynamic Getdata(String key) {
    return shearedPrefrercne?.get(key);
  }
}
