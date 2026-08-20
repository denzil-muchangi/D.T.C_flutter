import 'package:flutter/material.dart';
import 'package:dynamic_text_changer/core/storage/storage_service.dart';

class SettingsProvider extends ChangeNotifier {
  final StorageService _storageService;
  bool _isDarkMode = false;

  SettingsProvider(this._storageService) {
    _isDarkMode = _storageService.isDarkMode();
  }

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _storageService.saveDarkMode(_isDarkMode);
    notifyListeners();
  }
}
