import 'package:flutter/material.dart';
import 'package:resq_me/Models/Pharmacy_Model.dart';
import 'Hospital_Pharmacy_button.dart';

class Pharmacy_Card extends StatelessWidget {

  const Pharmacy_Card({super.key, required this.pharmacyModel});
  final PharmacyModel pharmacyModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child:  Column(
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                margin: const EdgeInsets.all(0),
                child: ListTile(
                  title:  Text(
                    pharmacyModel.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${pharmacyModel.government}, ${pharmacyModel.city}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                margin: EdgeInsets.all(1),
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Text(
                          'Open All Day',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomizedH_P_Button(name: 'Location', myIcon: Icons.directions_outlined,screen: Placeholder(),theRadius: 24.0,),
                        SizedBox(width: 8),
                        CustomizedH_P_Button(name: 'Call', myIcon: Icons.call_outlined,screen: Placeholder(),theRadius: 24.0,),
                        SizedBox(width: 8),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
