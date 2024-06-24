import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:resq_me/src/widgets/custom_button.dart';
import '../../Models/Calls.dart';

class HotlinesScreen extends StatefulWidget {
  const HotlinesScreen({super.key});

  @override
  State<HotlinesScreen> createState() => _HotlinesScreenState();
}

class _HotlinesScreenState extends State<HotlinesScreen> {
  final Calls calls = Calls();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 14,
          children: [
            Wrap(
              spacing: 14,
              children: [
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Health']!);
                  },
                  title: "Health",
                  icon: Icons.local_hospital_outlined,
                ),
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Water']!);
                  },
                  title: "Water",
                  icon: Icons.water_drop_outlined,
                ),
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Electricity']!);
                  },
                  title: "Electricity",
                  icon: Icons.electric_bolt_outlined,
                ),
              ],
            ),
            Wrap(
              spacing: 14,
              children: [
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Fire']!);
                  },
                  title: "Fire",
                  icon: Icons.fire_truck_outlined,
                ),
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Police']!);
                  },
                  title: "Police",
                  icon: Icons.local_police_outlined,
                ),
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Gas']!);
                  },
                  title: "Gas",
                  icon: Icons.gas_meter_outlined,
                ),
              ],
            ),
            Wrap(
              spacing: 14,
              children: [
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Traffic']!);
                  },
                  title: "Traffic",
                  icon: Icons.traffic_outlined,
                ),
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Network']!);
                  },
                  title: "Network",
                  icon: Icons.signal_cellular_alt_outlined,
                ),
                Button(
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber(calls.numbers['Customer Protection']!);
                  },
                  title: "Customer",
                  icon: Icons.support_agent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}