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

  Future<void> saveFirstTime({bool isFirstTime = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsKeys.isFirstTime, isFirstTime);
  }

  Future<void> saveNfcTagId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefsKeys.tagID, id);
  }

  Future<String> readNfcTagId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefsKeys.tagID) ?? "";
  }
}
