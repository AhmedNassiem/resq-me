import 'package:flutter/material.dart';

class CustomAddNoteTextField extends StatelessWidget {
  const CustomAddNoteTextField({
    super.key,
    required this.text, 
    this.maxLines = 1, 
    this.onSaved,
    this.onChanged
  });
  final String text;
final int maxLines;
 final  void Function(String)? onChanged;

 final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 80.0),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if(value?.isEmpty?? true){
            return 'feild is empty';
          }
          else {return null; 
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          border:const OutlineInputBorder(),
          enabledBorder: buildBorder(const Color.fromARGB(255, 217, 104, 96)),
          focusedBorder: buildBorder(Colors.black),
          labelText:text ,

          )

          
        ),

      );
  }
}


  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.black,
        ));
  }

