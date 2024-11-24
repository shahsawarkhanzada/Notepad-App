import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:notebook_app/Screens/DetailsScreen.dart';
//import 'package:notebook_app/Screens/HomeScreen.dart';
import 'package:notebook_app/Screens/NotepadScreen.dart';
import 'package:notebook_app/models/NotepadModel.dart';
//import 'package:notebook_app/models/details_model.dart';

//import 'package:notebook_app/models/notes_model.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  //Hive.registerAdapter(NotesModelAdapter());
  //Hive.registerAdapter(detailsmodelAdapter());
  Hive.registerAdapter(NotepadModelAdapter());

  // await Hive.openBox<NotesModel>('notes');
  //await Hive.openBox<details_model>('DetailsBox');
  await Hive.openBox<NotepadModel>('notepad');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const HomeScreen(),
      // home: const DetailsScreen(),
      home: const NotepadScreen(),
    );
  }
}
