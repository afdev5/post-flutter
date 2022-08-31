import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:posts/datasource/remote_datasource.dart';
import 'package:posts/models/post_model.dart';
import 'package:posts/models/user_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final RemoteDataSource dataSource;
  PostBloc(this.dataSource) : super(PostState()) {
    on<PostEvent>((event, emit) async {
      if(event is GetPosts) {
        emit(state.copyWith(isLoading: true));
        final datas = await dataSource.getPosts(event.users);
        emit(state.copyWith(isLoading: false, datas: datas, message: 'success'));
      }
    });
  }
}
