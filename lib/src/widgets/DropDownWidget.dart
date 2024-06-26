import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? _selectedValue;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadSelectedTheme(); // Load the selected theme mode from shared preferences
  }

  Future<void> _loadSelectedTheme() async {
    _prefs = await SharedPreferences.getInstance();
    String? themeMode = _prefs.getString('themeMode');
    if (themeMode != null) {
      setState(() {
        _selectedValue = themeMode;
      });
    }
  }

  Future<void> _saveSelectedTheme(String value) async {
    await _prefs.setString('themeMode',
        value); // Save the selected theme mode to shared preferences
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      hint: const Text('Select an option'),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Color(0xFFBA143C)),
      underline: Container(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        _saveSelectedTheme(newValue!); // Save the selected theme mode
        if (newValue == 'Dark Mode') {
          context.read<ThemeCubit>().setThemeMode(ThemeMode.dark);
        } else if (newValue == 'Light Mode') {
          context.read<ThemeCubit>().setThemeMode(ThemeMode.light);
        } else if (newValue == 'System Default') {
          context.read<ThemeCubit>().setThemeMode(ThemeMode.system);
        }
      },
      items: <String>['System Default', 'Dark Mode', 'Light Mode']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
