import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Mothod
  Widget signOutAndExit() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'Sign Out and Exit',
      onPressed: () {
          signOutThread();
      },
    );
  }

  Future<void> signOutThread()async{
    await firebaseAuth.signOut().then((resposne){
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        actions: <Widget>[signOutAndExit()],
      ),
      body: Text('body'),
    );
  }
}
