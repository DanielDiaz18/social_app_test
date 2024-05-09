import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.cover,
  });

  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? cover;

  @override
  List<Object?> get props => [
        id,
        avatar,
        name,
        email,
      ];
}
