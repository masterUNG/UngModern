import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explict
  Color myBlue = Color.fromARGB(255, 3, 155, 229);
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

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
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },onSaved: (String value){
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
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
      ),validator: (String value){
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Keep Email Format you@abc.com';
        }
      },onSaved: (String value){
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: myBlue),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: myBlue)),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: myBlue,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: myBlue),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: myBlue),
        hintText: 'More 6 Charactor',
      ),validator: (String value){
        if (value.length < 6) {
          return 'More 6 Charactor';
        }
      },onSaved: (String value){
        passwordString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $nameString, email = $emailString, password = $passwordString');
        }
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
