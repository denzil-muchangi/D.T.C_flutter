import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _historyKey = 'text_history';
  static const String _darkModeKey = 'dark_mode';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  List<String> getHistory() {
    return _prefs.getStringList(_historyKey) ?? [];
  }

  Future<void> saveHistory(List<String> history) async {
    await _prefs.setStringList(_historyKey, history);
  }

  bool isDarkMode() {
    return _prefs.getBool(_darkModeKey) ?? false;
  }

  Future<void> saveDarkMode(bool isDark) async {
    await _prefs.setBool(_darkModeKey, isDark);
  }

  Future<void> clearHistory() async {
    await _prefs.remove(_historyKey);
  }
}
