import 'package:flutter_noteapp/data/data_source/note_db.dart';
import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDB db;
  NoteRepositoryImpl(this.db);
  @override
  Future<List<Note>> getNotes() {
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(Note note) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNote(Note note) {
    throw UnimplementedError();
  }
}
