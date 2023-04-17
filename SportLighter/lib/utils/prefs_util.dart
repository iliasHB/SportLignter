
import 'package:shared_preferences/shared_preferences.dart';


class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }


  Future<dynamic> setStringList(key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.setStringList('$key', value);
    return result;
    print('SharedPreference Initialized');
  }

  Future<dynamic> getStringList(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('$key');
    return result;
    print('SharedPreference Initialized');
  }
}