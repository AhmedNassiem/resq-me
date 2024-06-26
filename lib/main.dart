import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:resq_me/app.dart';
import 'package:user_repository/user_repository.dart';

import 'Cubits/hospital_cubit.dart';
import 'Cubits/notes_cubit/notes_cubit.dart';
import 'Cubits/pharmacy_cubit.dart';
import 'Cubits/theme_cubit.dart';
import 'Models/Hive Model/Note_Model.dart';
import 'constants.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knotesbox);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ThemeCubit()),
    BlocProvider(
      create: (context) => NotesCubit(),
    ),
    BlocProvider(
      create: (context) => HospitalStateCubit(),
    ),
    BlocProvider(
      create: (context) => PharmacyCubit(),
    )
  ], child: MyApp(FirebaseUserRepo())));
}
