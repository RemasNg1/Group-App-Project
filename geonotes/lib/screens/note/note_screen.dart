import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:geonotes/screens/map/bloc/map_bloc.dart';
import 'package:geonotes/services/dataLayer/app_data_layer.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';
import 'package:geonotes/widgets/ListTile/note_list.dart';
import 'package:get_it/get_it.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({super.key});
  //   final LocationSettings locationSettings = LocationSettings(
  //   accuracy: LocationAccuracy.high,
  //   distanceFilter: 4,
  // );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("MyNote")),

        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            List<NoteResponse> myNotes = GetIt.I.get<AppDataLayer>().myNotes;
            print("NoteScreen");
            return Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(style: TextStyle(fontSize: 24), "Recently note"),
                  SizedBox(
                    height: context.getHeight(factor: 0.6),
                    width: context.getWidth(),
                    child: ListView.builder(
                      itemCount: myNotes.length,
                      itemBuilder: (context, index) {
                        return NoteList(note: myNotes[index]);
                      },
                    ),
                  ),
                  // TextButton(onPressed:getLocation, child: Text("getLocation"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
