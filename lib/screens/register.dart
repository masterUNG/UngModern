import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explict
  Color myBlue = Color.fromARGB(255, 3, 155, 229);

  // Method
  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green[600])),
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: Colors.green[600],
        ),
        labelText: 'Name :',
        labelStyle: TextStyle(color: Colors.green[600]),
        helperText: 'Type Display Name',
        helperStyle: TextStyle(color: Colors.green[600]),
        hintText: 'English Only',
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      style: TextStyle(color: Colors.yellow[900]),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[900])),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.yellow[900],
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: Colors.yellow[900]),
        helperText: 'Type Your Email',
        helperStyle: TextStyle(color: Colors.yellow[900]),
        hintText: 'you@abc.com',
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: Colors.pink[600]),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink[600])),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.pink[600],
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.pink[600]),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: Colors.pink[600]),
        hintText: 'More 6 Charactor',
      ),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          uploadButton(),
        ],
        backgroundColor: myBlue,
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 24.0),
          width: 250.0,
          child: Column(
            children: <Widget>[
              nameText(),emailText(),passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
