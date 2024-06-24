import 'package:flutter/material.dart';
import 'package:resq_me/Models/Hospital_Model.dart';
import 'Hospital_Pharmacy_button.dart';

class Hospital_Card extends StatelessWidget {
  final double padding;
  const Hospital_Card({super.key, required this.padding, required this.hospitalModel});
  final HospitalModel hospitalModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
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
                  title: Text(
                    hospitalModel.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${hospitalModel.government}, ${hospitalModel.city}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                margin: const EdgeInsets.all(1),
                child: Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: padding),
                        child:  Text(
                          hospitalModel.kindName,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomizedH_P_Button(name: 'Location', myIcon: Icons.directions_outlined,screen: Placeholder(),theRadius: 24.0,),
                        SizedBox(width: 8),
                        CustomizedH_P_Button(name: 'Call', myIcon: Icons.call_outlined,screen: Placeholder(),theRadius: 24.0,),
                        SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 15),
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
