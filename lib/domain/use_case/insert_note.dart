import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class InsertNote {
  final NoteRepository repository;

  InsertNote(this.repository);
  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}
