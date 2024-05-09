import 'package:equatable/equatable.dart';
import 'package:social_app/user/domain/user_model.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.owner,
    required this.createdAt,
    this.content,
    this.image,
  });

  final String id;
  final DateTime createdAt;
  final User owner;
  final String? content;
  final String? image;

  @override
  List<Object?> get props => [
        id,
        owner,
        content,
        image,
      ];
}
