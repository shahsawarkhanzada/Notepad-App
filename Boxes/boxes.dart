import 'package:hive/hive.dart';
import 'package:notebook_app/models/NotepadModel.dart';

class Boxes {
  static Box<NotepadModel> NotepadboxData() =>
      Hive.box<NotepadModel>('notepad');
}
