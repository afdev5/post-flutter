import 'dart:async';
import 'package:collection/collection.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts/datasource/remote_datasource.dart';
import 'package:posts/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDataSource dataSource;
  UserBloc(this.dataSource) : super(UserState()) {
    on<UserEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is LoginUser) {
        if(event.username.isEmpty || event.password.isEmpty) {
          emit(state.copyWith(isError: true, message: 'username dan password tidak boleh kosong'));
        } else {
          emit(state.copyWith(isLoading: true));
          final users = await dataSource.getUsers();
          final checkUser = users.firstWhereOrNull((element) => element.username.toLowerCase() == event.username.toLowerCase());
          if(users.isNotEmpty && checkUser != null) {
            emit(state.copyWith(isLoading: false, isError: false, message: 'login berhasil', user: checkUser, users: users));
          } else {
            emit(state.copyWith(isLoading: false, isError: true, message: 'username tidak ditemukan'));
          }
        }
      }
    });
  }
}
