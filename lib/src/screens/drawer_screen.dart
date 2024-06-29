import 'package:flutter/material.dart';

import '../widgets/Custom_ListTile.dart';
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
            Text('Drawer', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Help', style: TextStyle(fontWeight: FontWeight.bold)),
            CustomListTile(name: 'Detect', screen: DetectionScreen()),
            CustomListTile(name: 'Band Aid', screen: Text("Band Aid Screen")),
            Divider(color: Colors.grey, thickness: 0.5, endIndent: 30),
            CustomListTile(name: 'Hospitals', screen: Hospitals()),
            CustomListTile(name: 'Pharmacies', screen: Pharmacies()),
            Divider(color: Colors.grey, thickness: 0.5, endIndent: 30),
            Text('Personal', style: TextStyle(fontWeight: FontWeight.bold)),
            CustomListTile(name: 'Emergency Notes', screen: Notes()),
          ],
        ),
      ),
    );
  }
}
