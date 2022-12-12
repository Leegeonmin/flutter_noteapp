import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);
  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}
