import '../app_export.dart';

class Injector{

  static SharedPreferences? prefs;

  Injector() {
    getInstance();
  }

  Future getInstance() async => prefs = await SharedPreferences.getInstance();

  static setIntroKeys(bool id) async {
    prefs!.setBool(PrefsKey.introKeys, id);
  }

  static getIntroKeys()  {
    return prefs!.getBool(PrefsKey.introKeys);
  }

  static setAuthenticationKeys(String id) async {
    prefs!.setString(PrefsKey.authenticationKeys, id);
  }

  static getAuthenticationKeys()  {
    return prefs!.getString(PrefsKey.authenticationKeys);
  }

}