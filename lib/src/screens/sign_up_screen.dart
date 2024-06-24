import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Hey There,"),
            Text(
              "Create an account",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            Row(),
            SizedBox(
              width: 150,
              child: FilledButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Register")
                  ],
                ),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide()),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.ac_unit,
                        size: 46,
                      ),
                    )),
                Container(
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide()),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.local_fire_department_outlined,
                        size: 46,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
