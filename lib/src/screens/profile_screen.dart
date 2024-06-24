import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String gender = "Male";
  @override
  Widget build(BuildContext context) {
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
                    labelText: "Email Address", border: OutlineInputBorder()),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Phone Number", border: OutlineInputBorder()),
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
                    label: Text("Home Address"), border: OutlineInputBorder()),
              ),
              FilledButton(onPressed: () {}, child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
