import 'package:flutter/material.dart';
import 'package:posts/bloc/user/user_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final UserBloc userBloc;
  const ProfileScreen({Key? key, required this.userBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name : ${userBloc.state.user?.name}'),
          SizedBox(height: 6),
          Text('Username : ${userBloc.state.user?.username}'),
          SizedBox(height: 6),
          Text('Email : ${userBloc.state.user?.email}'),
          SizedBox(height: 6),
          Text('Address : ${userBloc.state.user?.address}'),
          SizedBox(height: 6),
          Text('Phone : ${userBloc.state.user?.phoneNumber}')
        ],
      ),
    );
  }
}
