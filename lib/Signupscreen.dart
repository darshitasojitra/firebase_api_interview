import 'dart:developer';

import 'package:firebase_api_interview/authscreen.dart';
import 'package:firebase_api_interview/loginscreen.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth=AuthService();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email',suffixIcon: Icon(Icons.email)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',suffixIcon: Icon(Icons.password)
              ),
            ),
          ),
          OutlinedButton(onPressed:_signup, child: Text('signup')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                },
                child: Text('login')),
          )
        ],
      ),
    );
  }
  _signup()async{
    final user=_auth.createUserWithEmailAndPAssword(_email.text, _password.text);
    if(user!=null){
      log('user created successfully');
    }
  }
}
