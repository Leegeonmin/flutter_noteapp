import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';
import 'package:flutter_noteapp/presentation/notes/notes_event.dart';
import 'package:flutter_noteapp/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;
  NotesViewModel(this.repository);

  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNotes: _deleteNotes,
      undoNotes: _undoNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> _notes = await repository.getNotes();
    _state = _state.copyWith(notes: _notes);
    notifyListeners();
  }

  Future<void> _deleteNotes(Note note) async {
    await repository.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _undoNote() async {
    if (_recentlyDeletedNote != null) {
      repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      _loadNotes();
    }
  }
}
