import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:flutter_noteapp/domain/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState(
      {@Default([]) List<Note> notes,
      required NoteOrder noteOrder}) = _NotesState;
}
