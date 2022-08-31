import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/bloc/user/user_bloc.dart';
import 'package:posts/views/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if(state.isError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text('${state.message}'),
              ).build(context);
            },
          );
        } else if(state.user != null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Login Screen'),),
          body: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                    hintText: 'username'
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password'
                ),
              ),
              SizedBox(height: 22),
              state.isLoading ? CircularProgressIndicator() : ElevatedButton(onPressed: () {
                BlocProvider.of<UserBloc>(context).add(LoginUser(username: _usernameController.text, password: _passwordController.text));
              }, child: Text('Login'))
            ],
          ),
        );
      },
    );
  }
}
