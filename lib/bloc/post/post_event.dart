part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetPosts extends PostEvent {
  final List<UserModel> users;

  GetPosts({required this.users});
}
