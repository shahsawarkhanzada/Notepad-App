// ignore_for_file: prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:notebook_app/models/NotepadModel.dart';

class NotepadEditScreen extends StatefulWidget {
  final NotepadModel notepadModel;
  NotepadEditScreen({super.key, required this.notepadModel});

  @override
  State<NotepadEditScreen> createState() => _NotepadEditScreenState();
}

class _NotepadEditScreenState extends State<NotepadEditScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.notepadModel.title);
    descriptionController =
        TextEditingController(text: widget.notepadModel.description);
  }

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
                widget.notepadModel.title = titleController.text;
                widget.notepadModel.description = descriptionController.text;
                widget.notepadModel.save();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done_outline,
                size: 30,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () async {
                await widget.notepadModel.delete();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('The item has been deleted')));
              },
              icon: const Icon(
                Icons.delete,
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
