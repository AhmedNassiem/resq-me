import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class CustomizedH_P_Button extends StatelessWidget {
  final void Function()? function;
  const CustomizedH_P_Button(
      {super.key,
      required this.name,
      required this.myIcon,
      required this.screen,
      required this.theRadius,
      this.function});
  final IconData myIcon;
  final String name;
  final Widget screen;
  final double theRadius;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: function,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            myIcon,
            color: Colors.white,
          ), // Your icon
          const SizedBox(width: 8.0), // Adjust the space between icon and text
          Text(
            '$name   ',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
