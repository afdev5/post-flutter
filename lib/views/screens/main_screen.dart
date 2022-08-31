import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/bloc/post/post_bloc.dart';
import 'package:posts/bloc/user/user_bloc.dart';
import 'package:posts/datasource/remote_datasource.dart';
import 'package:posts/views/screens/detail_post_screen.dart';
import 'package:posts/views/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late UserBloc _userBloc;
  var indexTab = 0;
  final _postBloc = PostBloc(RemoteDataSource());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _postBloc.add(GetPosts(users: _userBloc.state.users ?? []));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cinta Coding'),
      ),
      body: indexTab == 0 ? _body() : ProfileScreen(userBloc: _userBloc,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexTab,
        onTap: (index) {
          setState(() {
            indexTab = index;
          });
        },
        selectedItemColor: Color(0xfff11542),
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(12),
      child: BlocBuilder(
        bloc: _postBloc,
        builder: (context, PostState state) {
          if(state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            if(state.datas?.isEmpty ?? true) {
              return Center(child: Text('belum ada data post'));
            }
            return ListView.builder(
              itemCount: state.datas?.length,
              itemBuilder: (context, index) {
                final _data = state.datas![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostScreen(data: _data)));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(_data.title),
                      subtitle: Text(_data.user ?? '', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
