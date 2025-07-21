import 'dart:developer';

import 'package:firebase_api_interview/authscreen.dart';
import 'package:flutter/material.dart';

import 'categoryscreen.dart';
import 'Signupscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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
          OutlinedButton(onPressed:_login, child: Text('Login')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                },
                child: Text('Signup')),
          )
        ],
      ),
    );
  }
_login()async{
    final user=await _auth.loginUserWithEmailAndPAssword(_email.text, _password.text);
    if(user!=null){
      log('user login successfully');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Productdetailscreen()));
    }
}
}
