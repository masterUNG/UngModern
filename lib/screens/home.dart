import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  double myWidth = 120.0;
  String nameApp = 'อึ่ง Modern';

  // Method
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
        onPressed: () {},
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
        onPressed: () {},
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
