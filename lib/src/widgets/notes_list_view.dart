import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/notes_cubit/notes_cubit.dart';
import 'package:resq_me/Models/Hive%20Model/Note_Model.dart';
import 'package:resq_me/src/widgets/note.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return OneNote(
                note: notes[index],
              );
            });
      },
    );
  }
}
