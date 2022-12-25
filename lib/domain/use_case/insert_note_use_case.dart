import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class InsertNoteUseCase {
  final NoteRepository repository;

  InsertNoteUseCase(this.repository);
  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}
