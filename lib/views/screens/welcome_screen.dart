import 'package:flutter/material.dart';
import 'package:posts/views/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Cinta Coding'),),
      body: Column(
        children: [
          Image.asset('assets/login.jpeg', height: _size.height / 2),
          SizedBox(height: 22),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }, child: Text('Login'))
        ],
      ),
    );
  }
}
