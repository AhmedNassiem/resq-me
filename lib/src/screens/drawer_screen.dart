import 'package:flutter/material.dart';
import 'package:resq_me/src/widgets/Custom_ListTile.dart';

import 'detection_screen.dart';
import 'hospitals_screen.dart';
import 'note_Screen.dart';
import 'pharmacy_screen.dart';

class TheDrawer extends StatelessWidget {
  const TheDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTile(name: 'Detect', screen: DetectionScreen()),
            Divider(color: Colors.grey, thickness: 0.5, endIndent: 30),
            CustomListTile(name: 'Hospitals', screen: Hospitals()),
            CustomListTile(name: 'Pharmacies', screen: Pharmacies()),
            Divider(color: Colors.grey, thickness: 0.5, endIndent: 30),
            CustomListTile(name: 'Emergency Notes', screen: Notes()),
          ],
        ),
      ),
    );
  }
}
