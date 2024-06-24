import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:resq_me/Cubits/hospital_cubit.dart';
import 'package:resq_me/Cubits/notes_cubit/notes_cubit.dart';
import 'package:resq_me/Cubits/pharmacy_cubit.dart';
import 'package:resq_me/Cubits/theme_cubit.dart';
import 'package:resq_me/simple_bloc_observer.dart';
import 'package:resq_me/src/colors/color_schemes.dart';
import 'package:resq_me/src/screens/home_screen.dart';

import 'Models/Hive Model/Note_Model.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knotesbox);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => HospitalStateCubit(),
        ),
        BlocProvider(
          create: (context) => PharmacyCubit(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: lightColorScheme.surface,
            ),
            navigationBarTheme: NavigationBarThemeData(
              elevation: 0,
              backgroundColor: lightColorScheme.surface,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: darkColorScheme.surface,
            ),
            navigationBarTheme: NavigationBarThemeData(
              elevation: 0,
              backgroundColor: darkColorScheme.surface,
            ),
          ),
          themeMode: themeMode, // Set the themeMode from the BlocBuilder
          home: const HomeScreen(),
        );
      },
    );
  }
}
