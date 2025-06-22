import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geonotes/screens/map/map_screen.dart';
import 'package:geonotes/screens/note/note_screen.dart';
import 'package:geonotes/screens/profile/profile_screen.dart';
import 'package:meta/meta.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  int selectIndex = 0;
  List<Widget> screens = [
    NoteScreen(),
    MapScreen(),
    ProfileScreen(),
  ];

  BottomNavbarBloc() : super(BottomNavbarInitial()) {
    on<NavSelectionEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(
    NavSelectionEvent event,
    Emitter<BottomNavbarState> emit,
  ) {
    selectIndex = event.index;
    emit(SuccessState());
  }
 
}
