import 'package:hive_flutter/hive_flutter.dart';
part 'NotepadModel.g.dart';

@HiveType(typeId: 0)
class NotepadModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  NotepadModel({required this.title, required this.description});
}
