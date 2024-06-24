import 'package:flutter/material.dart';
import 'package:resq_me/src/widgets/DropDownWidget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mode',style: TextStyle(fontSize: 25,),),
              DropDownWidget()
            ],
          ),
        )
      ],
    );
  }
}
