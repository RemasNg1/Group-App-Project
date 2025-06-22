import 'dart:math';

import 'package:geonotes/models/note_model.dart';
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnection {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      supabase = await Supabase.initialize(
        url: "https://lhusplnfudjlffofawvr.supabase.co",
        anonKey:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxodXNwbG5mdWRqbGZmb2Zhd3ZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAzNDU0ODYsImV4cCI6MjA2NTkyMTQ4Nn0.Gc0swQQ9SqQH03BMbEHpXFjOI9R5NuLxECNwD491UkQ",
      );
      print("+++ connect supabase done ***");
    } catch (error) {
      throw FormatException("There is error with connect DB $error");
    }
  }

  static Future<List<NoteResponse>> getUserNote({
    required String authId,
  }) async {
    // toDo : get note by Id
    final result = await supabase?.client
        .from("notes")
        .select()
        .eq('authid', authId);
    ;
    List<NoteResponse> myNote = List.from(
      result ?? [],
    ).map((item) => NoteResponse.fromJson(item)).toList();
    print(myNote[0].title);

    return myNote;
  }

  static createNewNote({required NoteResponse note}) async {
    final result = await supabase?.client
        .from("notes")
        .insert(note.toJson())
        .select();
    print(result);
  }

  static editNote({required NoteResponse note}) async {
final result = await supabase?.client
    .from("notes")
    .update(note.toJson())
    .eq('authid', note.authid!)
    .eq('id', note.id!);
    print(result);
  }
  static deleteNote({required NoteResponse note}) async {
final result = await supabase?.client
    .from("notes")
    .delete()
    .eq('authid', note.authid!)
    .eq('id', note.id!);
    print("delete");
  }
}
