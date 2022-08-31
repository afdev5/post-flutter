part of 'post_bloc.dart';

class PostState extends Equatable {
  final bool isLoading;
  final bool isError;
  final String? message;
  final List<PostModel>? datas;

  PostState(
      {this.isLoading = false,
        this.message,
        this.datas,
        this.isError = false});

  PostState copyWith(
      {bool? isLoading,
        String? message,
        List<PostModel>? datas,
        bool? isError}) {
    return PostState(
        datas: datas ?? this.datas,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    message,
    datas,
    isError
  ];
}
