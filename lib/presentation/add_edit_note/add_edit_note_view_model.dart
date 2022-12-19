import 'dart:async';
import 'dart:io';

import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';
import 'package:flutter_noteapp/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_noteapp/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:flutter_noteapp/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;
  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(addNotes: _addNotes, changeColor: _changeColor);
  }

  int _color = roseBud.value;
  int get color => _color;

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;
  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _addNotes(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertNote(
        Note(
            title: title,
            content: content,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            color: _color),
      );
    } else {
      await repository.updateNote(
        Note(
            id: id,
            title: title,
            content: content,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            color: _color),
      );
    }
    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
