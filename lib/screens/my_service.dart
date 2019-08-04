import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_modern/screens/add_value.dart';
import 'package:ung_modern/screens/home_service.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameLoginString = '';
  Widget myWidget = HomeService();

  // Mothod
  @override
  void initState() {
    super.initState();
    findLogin();
  }

  Future<void> findLogin() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameLoginString = firebaseUser.displayName;
    });
    print('name = $nameLoginString');
  }

  Widget showImage() {
    return Container(
      width: 60.0,
      height: 60.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung Modern',
      style: TextStyle(fontFamily: 'Lobster'),
    );
  }

  Widget showLogin() {
    return Text(
      'Login by $nameLoginString',
      style: TextStyle(fontStyle: FontStyle.italic),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Colors.white, Colors.blue[700]],
        radius: 1.0,
      )),
      child: Column(
        children: <Widget>[
          showImage(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showHome() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Home'),
      trailing: Icon(Icons.navigate_next),onTap: (){
        setState(() {
          myWidget = HomeService();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget addValue() {
    return ListTile(
      leading: Icon(Icons.add_box),
      title: Text('Add Value'),
      trailing: Icon(Icons.navigate_next),onTap: (){
        setState(() {
          myWidget = AddValue();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget signOutExit() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out And Exit'),
      trailing: Icon(Icons.navigate_next),onTap: (){
        print('You Tap Singoit');
       signOutThread();
      },
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        myHeadDrawer(),
        showHome(),addValue(), signOutExit(),
      ],
    ));
  }

  Widget signOutAndExit() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'Sign Out and Exit',
      onPressed: () {
        signOutThread();
      },
    );
  }

  Future<void> signOutThread() async {
    await firebaseAuth.signOut().then((resposne) {
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
      body: myWidget,
      drawer: myDrawerMenu(),
    );
  }
}
