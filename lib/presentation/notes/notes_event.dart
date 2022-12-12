//  viewModel에서 유스케이스 외에도 view에서 발생하는 이벤트를 제어하기 위해 만든 class

import 'package:flutter_noteapp/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_event.freezed.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNotes(Note note) = DeleteNotes;
  const factory NotesEvent.undoNotes() = UndoNotes;
}
