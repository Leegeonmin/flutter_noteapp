import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_noteapp/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_noteapp/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteView extends StatefulWidget {
  final Note? note;
  const AddEditNoteView({super.key, this.note});

  @override
  State<AddEditNoteView> createState() => _AddEditNoteViewState();
}

class _AddEditNoteViewState extends State<AddEditNoteView> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription;
  final List<Color> noteColors = [
    roseBud,
    primRose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(saveNote: () {
          Navigator.pop(context, true);
        });
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();

    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_titleController.text.isEmpty ||
              _contentController.text.isEmpty) {
            const snackBar = SnackBar(content: Text("제목이나 내용이 비어있습니다"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          viewModel.onEvent(AddEditNoteEvent.addNotes(
              widget.note == null ? null : widget.note!.id,
              _titleController.text,
              _contentController.text));
        },
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: Color(viewModel.color),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: noteColors
                  .map((color) => GestureDetector(
                        onTap: () {
                          viewModel.onEvent(
                              AddEditNoteEvent.changeColor(color.value));
                        },
                        child: BuildBackgroundColor(
                          color: color,
                          isSelected: viewModel.color == color.value,
                        ),
                      ))
                  .toList(),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: darkGray),
              decoration: const InputDecoration(
                  hintText: "제목을 입력하세요", border: InputBorder.none),
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: darkGray),
              decoration: const InputDecoration(
                  hintText: "내용을 입력하세요", border: InputBorder.none),
            )
          ],
        ),
      ),
    );
  }
}

class BuildBackgroundColor extends StatelessWidget {
  Color color;
  bool isSelected;
  BuildBackgroundColor(
      {super.key, required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              spreadRadius: 1.0,
            )
          ],
          border:
              isSelected ? Border.all(color: Colors.black, width: 2.0) : null),
    );
  }
}
