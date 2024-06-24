import 'package:flutter/material.dart';
import 'package:resq_me/src/screens/hotlines_screen.dart';
import 'package:resq_me/src/screens/nearby_screen.dart';
import 'package:resq_me/src/screens/profile_screen.dart';
import 'package:resq_me/src/screens/settings_screen.dart';

import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  var titles = ["Hotlines", "Nearby", "Profile", "Settings"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TheDrawer(),
      appBar: AppBar(title: Text(titles[currentPageIndex]), centerTitle: true),
      body: [
        const HotlinesScreen(),
        const NearbyScreen(),
        const ProfileScreen(),
        const SettingsScreen()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
              icon: Icon(Icons.call_outlined), label: "Hotlines"),
          NavigationDestination(
              icon: Icon(Icons.map_outlined), label: "Nearby"),
          NavigationDestination(
              icon: Icon(Icons.person_outlined), label: "Profile"),
          NavigationDestination(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
