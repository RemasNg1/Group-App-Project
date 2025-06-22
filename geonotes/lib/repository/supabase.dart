import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      log("+++ connect supabase start ***");
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env["url"].toString(),
        anonKey: dotenv.env["anon_key"].toString(),
      );

      log("+++ connect supabase done ***");
    } catch (error) {
      throw FormatException("There is error with connect DB");
    }
  }

  static Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
      );
      return user.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign Up");
    }
  }

  static Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase!.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw FormatException("wrong");
      }
      return response.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("wrong");
    }
  }

  // static String? getUsersername() {

  static Future<String?> getUsername() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return null;

    final authId = user.id;

    final response = await Supabase.instance.client
        .from('user_info')
        .select('name')
        .eq('authid', authId)
        .maybeSingle();

    if (response == null || response['name'] == null) return null;

    return response['name'] as String;
  }

  static Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      print("User logged out successfully");
    } catch (e) {
      print("Error during logout: $e");
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
