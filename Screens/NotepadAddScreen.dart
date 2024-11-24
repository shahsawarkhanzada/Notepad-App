// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:notebook_app/Boxes/boxes.dart';
import 'package:notebook_app/models/NotepadModel.dart';

class NotepadAddScreen extends StatefulWidget {
  NotepadAddScreen({super.key});

  @override
  State<NotepadAddScreen> createState() => _NotepadAddScreenState();
}

class _NotepadAddScreenState extends State<NotepadAddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.grey),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final data = NotepadModel(
                    title: titleController.text,
                    description: descriptionController.text);

                final box = Boxes.NotepadboxData();
                box.add(data);
                data.save();
                titleController.clear();
                descriptionController.clear();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                size: 30,
                color: Colors.grey,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.green,
              style: const TextStyle(color: Colors.grey),
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: ' Title',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  border: InputBorder.none),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.grey),
              cursorColor: Colors.green,
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: ' Note something down',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  border: InputBorder.none),
            )
          ],
        ),
      ),
    );
  }
}
