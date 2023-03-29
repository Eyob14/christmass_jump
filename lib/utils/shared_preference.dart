import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> get prefs async {
    if (_prefs != null) {
      return _prefs!;
    }
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> setSoundEnabled(bool value) async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.setBool('isSoundEnabled', value);
  }

  static Future<bool?> isSoundEnabled() async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.getBool('isSoundEnabled');
  }

  static Future<bool> setGifts(int value) async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.setInt('gifts', value);
  }

  static Future<int?> getGifts() async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.getInt('gifts');
  }

  static Future<bool> setSelectedBall(String value) async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.setString('selectedBall', value);
  }

  static Future<String?> getSelectedBall() async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.getString('selectedBall');
  }
    static Future<bool> setSelectedPlayingBall(String value) async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.setString('selectedPlayingBall', value);
  }

  static Future<String?> getSelectedPlayingBall() async {
    final prefs = await SharedPreferenceHelper.prefs;
    return prefs.getString('selectedPlayingBall');
  }
}

// how to use it
// Set sound enabled
// await SharedPreferenceHelper.setSoundEnabled(true);

// // Get sound enabled
// bool? isSoundEnabled = await SharedPreferenceHelper.isSoundEnabled();

// // Set gifts
// await SharedPreferenceHelper.setGifts(100);

// // Get gifts
// int? gifts = await SharedPreferenceHelper.getGifts();

// // Set selected ball
// await SharedPreferenceHelper.setSelectedBall('red');

// // Get selected ball
// String? selectedBall = await SharedPreferenceHelper.getSelectedBall();
