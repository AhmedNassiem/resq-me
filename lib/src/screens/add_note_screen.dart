import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resq_me/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:resq_me/Cubits/notes_cubit/notes_cubit.dart';
import 'package:resq_me/src/widgets/add_note_form.dart';

class Add_Note extends StatelessWidget {
  const Add_Note({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
         BlocProvider(
          create: (context) => AddNoteCubit(),
          child: Scaffold(
                    appBar: AppBar(
                      title: const Padding(
                        padding: EdgeInsets.only(right: 48),
                        child: Center(
                            child: Text(
                          "Add Note",
                          style: TextStyle(fontSize: 26),
                        )),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: BlocConsumer<AddNoteCubit, AddNoteState>(
                        listener: (context, state) {
                          if (state is AddNoteFailure) {
                          }
        
                          if (state is AddNoteSuccess) {
                            BlocProvider.of<NotesCubit>(context).fetchallNotes();
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          return ModalProgressHUD(
                              inAsyncCall: state is AddNoteLoading ? true : false,
                              child: SingleChildScrollView(child: AddNoteform()));
                        },
                      ),
                    )),
        ),

      );
    

  }
}
