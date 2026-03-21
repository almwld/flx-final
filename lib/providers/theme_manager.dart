import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ThemeManager extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }

  ThemeData getTheme() {
    return _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  Color getTextColor(BuildContext context) {
    return AppTheme.getTextColor(context);
  }
}
