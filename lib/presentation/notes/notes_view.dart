import 'package:flutter/material.dart';
import 'package:flutter_noteapp/presentation/add_edit_note/add_edit_note_view.dart';
import 'package:flutter_noteapp/presentation/notes/components/note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Your note',
          style: TextStyle(fontSize: 30),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.sort))],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddEditNoteView()));
          },
          child: const Icon(Icons.add)),
      body: ListView(children: [
        NoteItem(),
        NoteItem(),
      ]),
    );
  }
}
