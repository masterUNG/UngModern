import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_modern/screens/my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  Color myTextColor = Colors.blue[700];
  double myWidth = 220.0;
  final formKey = GlobalKey<FormState>();
  String emailString = '', passwordString = '';

  // Method
  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 85.0,
        height: 85.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showText() {
    return Container(
      child: Text(
        'Ung Modern',
        style: TextStyle(
          fontSize: 24.0,
          color: myTextColor,
          fontFamily: 'Lobster',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: myWidth,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: myTextColor),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: myTextColor)),
            icon: Icon(
              Icons.email,
              color: myTextColor,
            ),
            helperText: 'Your Email',
            helperStyle: TextStyle(color: myTextColor)),
        onSaved: (valueObject) {
          emailString = valueObject.toString();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: myWidth,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: myTextColor),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: myTextColor)),
            icon: Icon(
              Icons.lock,
              color: myTextColor,
            ),
            helperText: 'Your Password',
            helperStyle: TextStyle(color: myTextColor)),
        onSaved: (value) {
          passwordString = value.toString();
        },
      ),
    );
  }

  Widget signInButton() {
    return Container(
      width: myWidth,
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        backgroundColor: myTextColor,
        child: Icon(
          Icons.navigate_next,
          size: 36.0,
        ),
        onPressed: () {
          formKey.currentState.save();
          print('email = $emailString, password = $passwordString');
          cheackAuthen();
        },
      ),
    );
  }

  Future<void> cheackAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Authen Success');

      var myServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context)
          .pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTextColor,
        title: Text('Authen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue[400]],
            radius: 1.0,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showLogo(),
              showText(),
              emailText(),
              passwordText(),
              signInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
