part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserStateInitial extends UserState {}

final class UserStateLoading extends UserState {}

final class UserStateError extends UserState {
  const UserStateError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class UserStateLoaded extends UserState {
  const UserStateLoaded({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}
