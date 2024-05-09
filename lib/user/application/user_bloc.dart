import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_app/user/domain/i_user_facade.dart';
import 'package:social_app/user/domain/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(IUserFacade facade) : super(UserStateInitial()) {
    on<UserEventGet>((event, emit) async {
      try {
        emit(UserStateLoading());
        final user = await facade.getUser();
        emit(UserStateLoaded(user: user));
      } catch (e) {
        emit(const UserStateError(message: 'there was an unexpected error'));
      }
    });
  }
}
