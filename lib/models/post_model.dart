import 'package:posts/models/comment_model.dart';

class PostModel {
  final int id;
  final int userId;
  final String? user;
  final String title;
  final String body;
  final List<CommentModel>? comments;

  PostModel(
      {required this.id,
        required this.userId,
        required this.title,
        required this.body,
        this.user,
        this.comments});

  PostModel copyWith({int? id, int? userId, String? title, String? body, List<CommentModel>? comments, String? user}) {
    return PostModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        body: body ?? this.body,
        comments: comments ?? this.comments,
        user: user ?? this.user
    );
  }

  factory PostModel.fromJson(dynamic json) => PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body']);
}
