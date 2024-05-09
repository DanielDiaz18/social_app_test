import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_app/user/domain/i_user_facade.dart';
import 'package:social_app/user/domain/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(IUserFacade facade) : super(UserState.initial()) {
    on<UserEventGet>((event, emit) async {
      try {
        emit(UserState.initial().copyWith(isLoading: true));
        final user = await facade.getUser();
        emit(state.copyWith(user: user, isLoading: false));
      } catch (e) {
        emit(
          state.copyWith(
            error: 'there was an unexpected error',
            isLoading: false,
          ),
        );
      }
    });
  }
}
