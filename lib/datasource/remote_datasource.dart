import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posts/models/comment_model.dart';
import 'package:posts/models/post_model.dart';
import 'package:posts/models/user_model.dart';
import 'package:collection/collection.dart';

class RemoteDataSource {
  Future<List<UserModel>> getUsers() async {
    final users = <UserModel>[];
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
      if(response.statusCode == 200) {
        response.data.forEach((e) {
          users.add(UserModel.fromJson(e));
        });
      }
    } catch (e) {
      debugPrint('Error get Users DIO -> $e');
    }

    return users;
  }

  Future<List<PostModel>> getPosts(List<UserModel> users) async {
    final datas = <PostModel>[];
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if(response.statusCode == 200) {
        await Future.forEach(response.data, (e) async {
          final post = PostModel.fromJson(e);
          final comments = await _getCommnents(post.id.toString());
          final user = users.firstWhereOrNull((element) => element.id == post.userId);
          datas.add(post.copyWith(comments: comments, user: user?.name));
        });
      }
    } catch (e) {
      debugPrint('Error get Posts DIO -> $e');
    }
    return datas;
  }

  Future<List<CommentModel>> _getCommnents(String postId) async {
    final datas = <CommentModel>[];
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts/$postId/comments');
      if(response.statusCode == 200) {
        response.data.forEach((e) {
          datas.add(CommentModel.fromJson(e));
        });
      }
    } catch (e) {
      debugPrint('Error get Comments DIO -> $e');
    }

    return datas;
  }

}