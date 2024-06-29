import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/src/widgets/DropDownWidget.dart';
import 'package:resq_me/src/widgets/custom_button.dart';

import '../../blocs/sign_in_bloc/sign_in_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mode',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              DropDownWidget()
            ],
          ),
        ),
        FilledButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            child: const Text("Sign Out"))
      ],
    );
  }
}
