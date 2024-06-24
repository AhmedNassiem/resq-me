import 'package:flutter/material.dart';

class custom_button_for_notes extends StatelessWidget {
  const custom_button_for_notes({super.key, this.onTap, required this.Txt});
 final void Function()? onTap;
  final String Txt;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            color:  Colors.redAccent,
            borderRadius: BorderRadius.circular(
              16,
            )),
        child:  Center(
          child: Text(
                  Txt,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
        ),
      )
  );
  }
  }
