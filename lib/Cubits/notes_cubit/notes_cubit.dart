import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:resq_me/Models/Hive%20Model/Note_Model.dart';
import 'package:resq_me/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchallNotes() {
    var noteBox = Hive.box<NoteModel>(knotesbox);

    notes  = noteBox.values.toList();
    emit(NotesSuccess());
  }
}
