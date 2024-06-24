import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.name,
    required this.screen,
  });

  final String name;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.circle, size: 15),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
      contentPadding: const EdgeInsets.only(left: 5),
      onTap: () {
        // Close the drawer
        Navigator.of(context).pop(); // This line closes the drawer.
        // Replace the current screen with the new screen and remove all previous screens
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen),
              (Route<dynamic> route) => route.isFirst,
        );
      },
    );
  }
}
