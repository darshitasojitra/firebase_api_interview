
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final _auth=FirebaseAuth.instance;
  Future<User?>loginUserWithEmailAndPAssword(String email,String password)async{
    try{
      final cread=await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cread.user;
    }catch(e){
      log('something went wrong');
    }
    return null;
  }
  Future<User?>createUserWithEmailAndPAssword(String email,String password)async{
    try{
      final cread=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cread.user;
    }catch(e){
      log('something went wrong');
    }
    return null;
  }
  Future<void>signout()async{
    try{
       await _auth.signOut();
    }catch(e){
      log('something went wrong');
    }
  }
}