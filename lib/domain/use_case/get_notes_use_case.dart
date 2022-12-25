import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/repository/note_repository.dart';
import 'package:flutter_noteapp/domain/util/note_order.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);
  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();

    noteOrder.when(
      title: (ordertype) {
        ordertype.when(ascending: () {
          notes.sort(((a, b) => a.title.compareTo(b.title)));
        }, descending: () {
          notes.sort(((a, b) => -a.title.compareTo(b.title)));
        });
      },
      date: (ordertype) {
        ordertype.when(ascending: () {
          notes.sort(((a, b) => a.timestamp.compareTo(b.timestamp)));
        }, descending: () {
          notes.sort(((a, b) => -a.timestamp.compareTo(b.timestamp)));
        });
      },
      color: (ordertype) {
        ordertype.when(ascending: () {
          notes.sort(((a, b) => a.color.compareTo(b.color)));
        }, descending: () {
          notes.sort(((a, b) => -a.color.compareTo(b.color)));
        });
      },
    );

    return notes;
  }
}
