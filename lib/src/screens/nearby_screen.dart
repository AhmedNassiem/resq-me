import 'package:flutter/material.dart';
import 'package:resq_me/src/screens/map_screen.dart';
import 'package:resq_me/src/widgets/custom_button.dart';

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 14,
          children: [
            Text(
              'Health',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
              ),
            ),
            Wrap(
              spacing: 14,
              children: [
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "Hospitals",
                    icon: Icons.local_hospital_outlined),
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "Pharmacies",
                    icon: Icons.vaccines_outlined),
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "Clinics",
                    icon: Icons.emergency_outlined),
              ],
            ),
            Text(
              'Governmental',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
              ),
            ),
            Wrap(
              spacing: 14,
              children: [
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "Police",
                    icon: Icons.local_police_outlined),
                Button(
                    onPressed: () {},
                    title: "Civil Registry",
                    icon: Icons.badge_outlined),
              ],
            ),
            Text(
              'Financial',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
              ),
            ),
            Wrap(
              spacing: 14,
              children: [
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "Bank",
                    icon: Icons.account_balance_outlined),
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "ATM",
                    icon: Icons.local_atm_outlined),
              ],
            ),
            Text(
              'Services',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
              ),
            ),
            Wrap(
              spacing: 14,
              children: [
                Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapScreen()),
                      );
                    },
                    title: "Mechanic",
                    icon: Icons.tire_repair_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
