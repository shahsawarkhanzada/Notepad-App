import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notebook_app/Boxes/boxes.dart';
import 'package:notebook_app/Screens/NotepadAddScreen.dart';
import 'package:notebook_app/Screens/NotepadEditScreen.dart';
import 'package:notebook_app/models/NotepadModel.dart';

class NotepadScreen extends StatefulWidget {
  const NotepadScreen({super.key});

  @override
  State<NotepadScreen> createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 75, left: 12),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
           const Text(
              'Notes',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            ValueListenableBuilder<Box<NotepadModel>>(
              valueListenable: Boxes.NotepadboxData().listenable(),
              builder: (context, box, _) {
                final data = box.values.toList().cast<NotepadModel>();
                return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotepadEditScreen(
                                        notepadModel: data[index],
                                      )));
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 17, 16, 16),
                          margin: const EdgeInsets.all(5),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].title.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(data[index].description.toString(),
                                    style: const TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
            Positioned(
              bottom: 10,
              width: 50,
              height: 50,
              left: 155,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotepadAddScreen()));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotepadAddScreen()));
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
