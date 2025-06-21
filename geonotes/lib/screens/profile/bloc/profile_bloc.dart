import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  bool isEnable = true;

  ProfileBloc() : super(ProfileInitial()) {
    on<ChangeNotificationEvent>((event, emit) {
      isEnable = !isEnable;
      emit(SuccessState());
    });
  }
}
