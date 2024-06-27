import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:resq_me/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:resq_me/src/screens/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String gender = "Male";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state.status == AuthenticationStatus.authenticated) {
        return SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height - 160,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        labelText: "Full Name", border: OutlineInputBorder()),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder()),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Gender :"),
                      const Text("Male"),
                      Radio(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          }),
                      const Text("Female"),
                      Radio(
                          value: "Female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          })
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        label: Text("Home Address"),
                        border: OutlineInputBorder()),
                  ),
                  FilledButton(onPressed: () {}, child: const Text("Save"))
                ],
              ),
            ),
          ),
        );
      } else {
        return BlocProvider(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
          child: const WelcomeScreen(),
        );
      }
    });
  }
}
