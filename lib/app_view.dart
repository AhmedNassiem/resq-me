import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/theme_cubit.dart';
import 'package:resq_me/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:resq_me/src/colors/color_schemes.dart';
import 'package:resq_me/src/screens/welcome_screen.dart';

import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'src/screens/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: lightColorScheme,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
            ),
            themeMode: themeMode, // Set the themeMode from the BlocBuilder
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                return BlocProvider(
                  create: (context) => SignInBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository),
                  child: const HomeScreen(),
                );
              } else {
                return const WelcomeScreen();
              }
            }));
      },
    );
  }
}
