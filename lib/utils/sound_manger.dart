import 'package:audioplayers/audioplayers.dart';
import 'package:christmass_jump/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class SoundManager {
  static final _gameAudioPlayer = AudioPlayer();
  static final _buttonAudioPlayer = AudioPlayer();

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<bool> isSoundEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool('isSoundEnabled') ?? true;
  }

  static Future<void> playButtonClickSound() async {
    final isEnabled = await isSoundEnabled();
    if (!isEnabled) return;
    print("*******************button clicked****************");
    _buttonAudioPlayer.play(AssetSource(buttonClickSound));
  }

  static Future<void> playGameSound() async {
    final isEnabled = await isSoundEnabled();
    if (!isEnabled) return;
    _gameAudioPlayer.play(AssetSource(gameSound));
  }

  static void stopGameSound() {
    _gameAudioPlayer.stop();
  }

  static Future<void> toggleSound(bool value) async {
    if (!value) {
      stopGameSound();
    }
    await SharedPreferenceHelper.setSoundEnabled(value);
    // if (!value) {
    //   stopGameSound();
    // } else {
    //   playGameSound();
    // }
  }

  // static Future<void> initialize() async {
  //   await SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);

  //   final isEnabled = await isSoundEnabled();
  // if (isEnabled) {
  //   if (_audioCache == null) {
  //     _audioCache = AudioCache(prefix: 'assets/sound/');
  //     await _audioCache!.loadAll([_buttonClickSound, _gameSound]);
  //   }
  //   playGameSound();
  // }
  // }
}
