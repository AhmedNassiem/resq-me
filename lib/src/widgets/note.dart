import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/notes_cubit/notes_cubit.dart';
import 'package:resq_me/Models/Hive%20Model/Note_Model.dart';
import 'package:resq_me/src/screens/edit_note_screen.dart';

class OneNote extends StatelessWidget {
  const OneNote({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align texts to the start (left)
                    children: [
                      Text(note.title),
                      Text(
                        note.subtitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(note.date),
                    ],
                  ),
                  const Spacer(), // This will push the icons row to the end of the main axis
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       EditeNoteScreen(note: note,),),);
                        },
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 35,
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Provide some space between the icons
                      IconButton(
                        icon: Icon(Icons.delete, size: 35),
                        onPressed: () {
                          note.delete();
                            BlocProvider.of<NotesCubit>(context).fetchallNotes();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
