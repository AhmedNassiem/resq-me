import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/notes_cubit/notes_cubit.dart';
import 'package:resq_me/Models/Hive%20Model/Note_Model.dart';
import 'package:resq_me/src/widgets/CustomTextField.dart';
import 'package:resq_me/src/widgets/custom_button_for_notes%20.dart';

class EditeNoteBody extends StatefulWidget {
  const EditeNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditeNoteBody> createState() => _EditeNoteBodyState();
}

class _EditeNoteBodyState extends State<EditeNoteBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 48),
          child: Center(
              child: Text(
            "Edite Note",
            style: TextStyle(fontSize: 26),
          )),
        ),
      ),
      body: Column(
        children: [
          CustomAddNoteTextField(
            text: 'OverView',
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          CustomAddNoteTextField(
            text: 'Name',
            onChanged: (value) {
              title = value;
            },
          ),
          custom_button_for_notes(
            Txt: 'Edit ',
            onTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchallNotes();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
