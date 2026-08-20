import 'package:flutter/material.dart';
import '../../../../core/storage/storage_service.dart';

class TextChangerProvider extends ChangeNotifier {
  final StorageService _storageService;
  String _currentText = '';
  List<String> _history = [];

  TextChangerProvider(this._storageService) {
    _history = _storageService.getHistory();
  }

  String get currentText => _currentText;
  List<String> get history => _history;

  void updateText(String text) {
    _currentText = text;
    notifyListeners();
  }

  void saveToHistory() {
    if (_currentText.isNotEmpty && !_history.contains(_currentText)) {
      _history.insert(0, _currentText);
      _storageService.saveHistory(_history);
      notifyListeners();
    }
  }

  void clearHistory() {
    _history.clear();
    _storageService.clearHistory();
    notifyListeners();
  }

  void restoreFromHistory(String text) {
    _currentText = text;
    notifyListeners();
  }

  void removeFromHistory(int index) {
    _history.removeAt(index);
    _storageService.saveHistory(_history);
    notifyListeners();
  }
}
