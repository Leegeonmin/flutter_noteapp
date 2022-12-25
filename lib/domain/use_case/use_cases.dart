import 'package:flutter_noteapp/domain/use_case/delete_note_use_case.dart';
import 'package:flutter_noteapp/domain/use_case/get_note_use_case.dart';
import 'package:flutter_noteapp/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_noteapp/domain/use_case/insert_note_use_case.dart';
import 'package:flutter_noteapp/domain/use_case/update_note_use_case.dart';

class UseCases {
  final DeleteNoteUseCase deleteNoteUseCase;
  final GetNoteUseCase getNoteUseCase;
  final GetNotesUseCase getNotesUseCase;
  final InsertNoteUseCase insertNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;

  UseCases(
      {required this.deleteNoteUseCase,
      required this.getNoteUseCase,
      required this.getNotesUseCase,
      required this.insertNoteUseCase,
      required this.updateNoteUseCase});
}
