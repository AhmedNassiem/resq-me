import 'package:flutter/material.dart';
import 'package:resq_me/Models/Hive%20Model/Note_Model.dart';
import 'package:resq_me/src/widgets/edit_note%20_body.dart';

class EditeNoteScreen extends StatelessWidget {
  const EditeNoteScreen({super.key, required this.note});
final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  EditeNoteBody(note: note,);
  }
}


