import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);
  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    notes.sort(((a, b) => -a.timestamp.compareTo(b.timestamp)));

    return notes;
  }
}