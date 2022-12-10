import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<List<Note>> getNotes() {}
  @override
  Future<Note> getNoteById(int id) {}
  @override
  Future<void> insertNote(Note note) {}
  @override
  Future<void> updateNote(Note note) {}
  @override
  Future<void> deleteNote(Note note) {}
}
