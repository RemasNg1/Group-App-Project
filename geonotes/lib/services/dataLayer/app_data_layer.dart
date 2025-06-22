
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:geonotes/repository/supabase.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppDataLayer {
 List<NoteResponse> myNotes = [];
 Set<Marker> myNotesMarks = {};

 loadDataFromSupabase() async {
   myNotes = await SupabaseConnection.getUserNote(authId: '04811af9-78c9-49a3-92b3-9f857b540621');
  if(myNotes.isNotEmpty){
   myNotesMarks = myNotes.map(
    (item)=> Marker(
          markerId: MarkerId("123${item.latitude},${item.longitude}"),
          position: LatLng(item.latitude!, item.longitude!),
        )
   ).toSet();
     }
    //  await Future.delayed(const Duration(seconds: 2));

  }
}
