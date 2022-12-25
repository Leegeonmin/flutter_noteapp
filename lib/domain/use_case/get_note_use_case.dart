import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class GetNoteUseCase {
  NoteRepository repository;
  GetNoteUseCase(this.repository);

  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
