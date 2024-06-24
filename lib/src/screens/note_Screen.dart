import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/notes_cubit/notes_cubit.dart';
import 'package:resq_me/src/screens/add_note_screen.dart';
import 'package:resq_me/src/screens/drawer_screen.dart';
import 'package:resq_me/src/widgets/Hospital_Pharmacy_button.dart';
import 'package:resq_me/src/widgets/notes_list_view.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

    @override
  void initState() {
   BlocProvider.of<NotesCubit>(context).fetchallNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
  Scaffold(
        drawer: const TheDrawer(),
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(right: 60),
            child: Center(child: Text('Notes')),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Column(children: [
          Center(
            child: CustomizedH_P_Button(
                name: "Add",
                myIcon: Icons.add,
                screen: Add_Note(),
                theRadius: 50),
          ),
          Expanded(child: NotesListView()),
        ]),
      );
    
    
  }
}

