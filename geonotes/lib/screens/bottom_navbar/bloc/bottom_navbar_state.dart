part of 'bottom_navbar_bloc.dart';

@immutable
sealed class BottomNavbarState {}

final class BottomNavbarInitial extends BottomNavbarState {}

final class SuccessState extends BottomNavbarState {}
