part of 'user_bloc.dart';

class UserState {
  final bool isLoading;
  final bool isError;
  final String? message;
  final UserModel? user;
  final List<UserModel>? users;

  UserState(
      {this.isLoading = false,
        this.message,
        this.user,
        this.isError = false,
        this.users});

  UserState copyWith(
      {bool? isLoading,
        String? message,
        UserModel? user,
        bool? isError,
        List<UserModel>? users}) {
    return UserState(
        user: user ?? this.user,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        users: users ?? this.users);
  }
}

