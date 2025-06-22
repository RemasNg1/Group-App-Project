import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geonotes/repository/supabase.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  bool isEnable = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ProfileBloc() : super(ProfileInitial()) {
    on<ChangeNotificationEvent>((event, emit) {
      isEnable = !isEnable;
      emit(SuccessState());
    });
    on<LogoutEvent>((event, emit) async {
      try {
        await SupabaseConnect.logout();
        print("User logged out successfully");
        emit(LogoutSuccess());
      } catch (e) {
        print("Error during logout: $e");
        emit(LogoutFailure(e.toString()));
      }
    });

    on<UpdateProfileInfoEvent>((event, emit) async {
      try {
        final user = Supabase.instance.client.auth.currentUser;
        if (user == null) return;

        await Supabase.instance.client
            .from('user_info')
            .update({'name': event.name})
            .eq('authid', user.id);

        if (event.password.isNotEmpty) {
          await Supabase.instance.client.auth.updateUser(
            UserAttributes(password: event.password),
          );
        }

        emit(ProfileUpdatedSuccessfully());
      } catch (e) {
        emit(ProfileError());
      }
    });
  }
}
