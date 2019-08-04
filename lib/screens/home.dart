import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_modern/screens/authen.dart';
import 'package:ung_modern/screens/my_service.dart';
import 'package:ung_modern/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 120.0;
  String nameApp = 'อึ่ง Modern';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  @override
  void initState() { 
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus()async{

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      
      var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);

    }

  }


  Widget mySizebox() {
    return SizedBox(
      height: 16.0,
    );
  }

  Widget signUpButton() {
    return Container(
      width: 200.0,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.blue[400]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.blue[800]),
        ),
        onPressed: () {
          print('You Click SignUp');
          // Route
          var registerRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
              Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  Widget singInButton() {
    return Container(
      width: 200.0,
      child: RaisedButton(
        color: Colors.blue[400],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {

          var authenRoute = MaterialPageRoute(builder: (BuildContext context) => Authen());
          Navigator.of(context).push(authenRoute);

        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: myWidth,
        height: myWidth,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      nameApp,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue[800],
        fontWeight: FontWeight.normal,
        fontFamily: 'Lobster',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue[400]],
            radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizebox(),
            showAppName(),
            singInButton(),
            signUpButton(),
          ],
        ),
      ),
    );
  }
}
