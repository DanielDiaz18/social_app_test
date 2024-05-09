part of 'user_bloc.dart';

final class UserState extends Equatable {
  const UserState({
    this.error,
    required this.isLoading,
    this.user,
  });

  factory UserState.initial() => const UserState(isLoading: false);

  final String? error;
  final bool isLoading;
  final User? user;

  UserState copyWith({
    error,
    isLoading,
    user,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? user,
    );
  }

  @override
  List<Object?> get props => [
        error,
        isLoading,
        user,
      ];
}
