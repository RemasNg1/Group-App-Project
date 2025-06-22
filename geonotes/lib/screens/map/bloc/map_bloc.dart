import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:geonotes/models/note_model.dart';
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:geonotes/repository/supabase.dart';
import 'package:geonotes/services/dataLayer/app_data_layer.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<MapEvent>((event, emit) async {});
    on<AddMapAddressWithNote>(addMapAddress);
    on<UpdateNote>(updateNote);
    on<DeleteNote>(deleteNote);
  }

  FutureOr<void> deleteNote(DeleteNote event, Emitter<MapState> emit) {
    
     NoteResponse deletedNote = event.deletedNote;
    
    SupabaseConnection.deleteNote(note: deletedNote);
    emit(DeleteNoteSuccessfully());
  }
  FutureOr<void> updateNote(UpdateNote event, Emitter<MapState> emit) {
    NoteResponse updatedNote = event.updatedNote;
    
    SupabaseConnection.editNote(note: updatedNote);
    emit(UpdateNoteSuccessfully());

  }

  FutureOr<void> addMapAddress(
    AddMapAddressWithNote event,
    Emitter<MapState> emit,
  ) async {
    NoteModel newNote = event.newNote;
    var marks = GetIt.I.get<AppDataLayer>().myNotesMarks;
    var notes = GetIt.I.get<AppDataLayer>().myNotes;

    if (newNote.title.isNotEmpty) {
      marks.add(
        Marker(
          markerId: MarkerId("123${newNote.latitude}"),
          position: LatLng(newNote.latitude, newNote.longitude),
        ),
      );
      NoteResponse createdNote = NoteResponse(
        //todo:  change  authId
        authid: "04811af9-78c9-49a3-92b3-9f857b540621",
        title: newNote.title,
        content: newNote.content,
        latitude: newNote.latitude,
        longitude: newNote.longitude,
        isDeleted: false,
        createdAt: DateTime.now().toIso8601String(),
      );

      notes.add(createdNote);
      sendNotificationViaRestApi();
      SupabaseConnection.createNewNote(note: createdNote);
      emit(AddMapAddressSuccessfully());
    }
  }

  Future<void> sendNotificationViaRestApi() async {
    //Audience => Subscriptions => Subscription ID: 7ac4b88a-d33b-4ad2-b834-15d1d3f796aa
    final String playerID = "7ac4b88a-d33b-4ad2-b834-15d1d3f796aa";

    final String oneSignalRestApiKey =
        "os_v2_app_hsdjfpdugvffrajearojwm3roftxhnuj7pmew34iifmmfwhkdiyrf6nxh6fjhoniktf65lcdsjg5azqgco5epomoo5kbsujmep2xwga";
    //Settings => Keys & IDs => OneSignal App ID
    final String oneSignalAppId = "3c8692bc-7435-4a58-8124-045c9b337171";
    final url = Uri.parse('https://api.onesignal.com/notifications');

    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Basic $oneSignalRestApiKey',
    };

    final payload = {
      "app_id": oneSignalAppId,
      "include_player_ids": [playerID],
      "headings": {"en": "created note successful "},
      "contents": {"en": "you can see your note on the map"},
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        print("Notification sent successfully");
      } else {
        print(" Failed to send notification. Code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print(" Exception: $e");
    }
  }

}
