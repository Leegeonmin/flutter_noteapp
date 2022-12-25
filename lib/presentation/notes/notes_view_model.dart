import 'package:flutter/cupertino.dart';
import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/use_case/use_cases.dart';
import 'package:flutter_noteapp/presentation/notes/notes_event.dart';
import 'package:flutter_noteapp/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final UseCases useCases;
  NotesViewModel(this.useCases) {
    _loadNotes();
  }

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
    List<Note> _notes = await useCases.getNotesUseCase();
    _state = _state.copyWith(notes: _notes);
    notifyListeners();
  }

  Future<void> _deleteNotes(Note note) async {
    await useCases.deleteNoteUseCase(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _undoNote() async {
    if (_recentlyDeletedNote != null) {
      useCases.insertNoteUseCase(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      _loadNotes();
    }
  }
}
