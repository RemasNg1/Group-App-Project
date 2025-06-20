part of 'bottom_navbar_bloc.dart';

@immutable
sealed class BottomNavbarEvent {}

class NavSelectionEvent extends BottomNavbarEvent {
  final int index;

  NavSelectionEvent({required this.index});
}
