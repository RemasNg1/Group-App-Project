import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/models/note_model.dart';
import 'package:geonotes/screens/add_note/add_note.dart';
import 'package:geonotes/screens/map/bloc/map_bloc.dart';
import 'package:geonotes/services/dataLayer/app_data_layer.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: Scaffold(

        body: Center(
          child: SizedBox(
            height: context.getHeight(),
            width: context.getWidth(),
            child: Builder(
              builder: (context) {
                var bloc = context.read<MapBloc>();
                var marks = GetIt.I.get<AppDataLayer>().myNotesMarks;
                print("updated");
                return BlocBuilder<MapBloc, MapState>(
        
                  builder: (context, state) {
                    return GoogleMap(
                      myLocationButtonEnabled: false,
                      markers: marks,
                  
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          marks.last.position.latitude,
                          marks.last.position.longitude,
                        ),
                        zoom: 14.4746,
                      ),
                      onLongPress: (argument) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNote(
                              saveNote: (Map<String, String> newNote) {
                                bloc.add(
                                  AddMapAddressWithNote(
                                    newNote: NoteModel(
                                      title: newNote['title']!,
                                      content: newNote['content']!,
                                      latitude: argument.latitude,
                                      longitude: argument.longitude,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
