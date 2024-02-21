import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/utils/utils.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  LocalStorage._init();
  late SharedPreferences _prefs;

  Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
    // await prefs.setString(_brightness, 'light-S');
  }

  SharedPreferences get prefs {
    return _prefs;
  }

  final String _token = 'token';
  final String _name = 'name';
  final String _id = 'id';
  final String _email = 'email';
  final String _language = 'language';
  final String _brightness = 'brightness';
  final String _loggedIn = 'loggedIn';
  final String _firstTime = 'firstTime';
  final String _profilePhoto = 'profile_photo';

  String getName() {
    return prefs.getString(_name)!;
  }

  String? getProfilePhoto() {
    return prefs.getString(_profilePhoto);
  }

  Future<String> setName(String value) async {
    await prefs.setString(_name, value);
    return value;
  }

  Future<String> setEmail(String value) async {
    await prefs.setString(_email, value);
    return value;
  }

  Future<String> setProfilePhoto(String value) async {
    await prefs.setString(_profilePhoto, value);
    return value;
  }

  String getEmail() {
    return prefs.getString(_email)!;
  }

  bool getFirstTime() {
    return prefs.getBool(_firstTime) ?? true;
  }

  Future<bool> setFirstTime() async {
    return await prefs.setBool(_firstTime, true);
  }

  bool getLoggedIn() {
    return prefs.getBool(_loggedIn) ?? false;
  }

  Future<bool> setLoggedIn(bool value) async {
    return await prefs.setBool(_loggedIn, value);
  }

  int getId() {
    return prefs.getInt(_id)!;
  }

  String? getToken() {
    return prefs.getString(_token);
  }

  Future<bool> setAppBrightness(AppBrightness value, [String? name]) async {
    /// light light-S
    /// dark dark-S
    if (value == AppBrightness.systemDark) {
      return await prefs.setString(_brightness, '$name-S');
    } else if (value == AppBrightness.systemLight) {
      return await prefs.setString(_brightness, '$name-S');
    }
    return await prefs.setString(_brightness, value.name);
  }

  AppBrightness getBrightness() {
    var brightness = prefs.getString(_brightness);
    if (brightness == null) {
      return AppBrightness.none;
    }

    return brightness.brightness;
  }

  Future<bool> setLanguage(String value) async {
    return await prefs.setString(_language, value);
  }

  String getLanguage() {
    return prefs.getString(_language) ?? 'en';
  }
}
