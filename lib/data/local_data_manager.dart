import 'package:flutter_banco_douro/data/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataManager {
  Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool(PrefsKeys.isFirstTime);
    if (result == null) {
      return true;
    }
    return result;
  }
}
