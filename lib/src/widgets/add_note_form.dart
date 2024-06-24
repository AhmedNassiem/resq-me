import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:resq_me/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:resq_me/Models/Hive%20Model/Note_Model.dart';

import 'package:resq_me/src/widgets/CustomTextField.dart';
import 'package:resq_me/src/widgets/custom_button_for_notes%20.dart';

class AddNoteform extends StatefulWidget {
  const AddNoteform({super.key});

  @override
  State<AddNoteform> createState() => _AddNoteformState();
}

final GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title, subtitle;

class _AddNoteformState extends State<AddNoteform> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAddNoteTextField(
            text: 'OverView',
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          CustomAddNoteTextField(
            text: 'Name',
            onSaved: (value) {
              title = value;
            },
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return custom_button_for_notes(
                Txt: 'add',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
  
                  var currentDate = DateTime.now();

                    var formattedCurrentDate =
                        DateFormat('yyyy-MM-dd hh:mm').format(currentDate);

                   
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formattedCurrentDate,);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
