import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadSavedTheme(); // Load saved theme mode during initialization
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
    _saveThemeMode(themeMode); // Save selected theme mode
  }

  Future<void> _loadSavedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeMode = prefs.getString('themeMode');
    if (themeMode == 'Dark Mode') {
      emit(ThemeMode.dark);
    } else if (themeMode == 'Light Mode') {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.system);
    }
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', _themeModeToString(themeMode));
  }

  String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.light:
        return 'Light Mode';
      default:
        return 'System Default';
    }
  }
}
