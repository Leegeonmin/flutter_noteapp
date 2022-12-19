import 'package:flutter/material.dart';
import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/presentation/add_edit_note/add_edit_note_view.dart';
import 'package:flutter_noteapp/presentation/notes/components/note_item.dart';
import 'package:flutter_noteapp/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
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
      body: ListView(
          children: viewModel.state.notes
              .map((e) => NoteItem(
                    note: e,
                  ))
              .toList()),
    );
  }
}
