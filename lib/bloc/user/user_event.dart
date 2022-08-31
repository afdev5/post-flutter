part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoginUser extends UserEvent {
  final String username;
  final String password;

  LoginUser({required this.username, required this.password});
}