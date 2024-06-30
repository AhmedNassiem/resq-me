import 'package:flutter/material.dart';

class NoteButton extends StatelessWidget {
  const NoteButton(
      {super.key,
      required this.name,
      required this.myIcon,
      required this.screen,
      required this.theRadius});
  final IconData myIcon;
  final String name;
  final Widget screen;
  final double theRadius;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
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
