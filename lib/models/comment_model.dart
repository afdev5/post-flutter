class CommentModel {
  final int id;
  final int postId;
  final String email;
  final String body;

  CommentModel(
      {required this.id,
        required this.postId,
        required this.email,
        required this.body});

  factory CommentModel.fromJson(dynamic json) => CommentModel(
      id: json['id'],
      postId: json['postId'],
      email: json['email'],
      body: json['body']);
}
