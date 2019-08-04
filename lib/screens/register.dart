import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ung_modern/screens/my_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explict
  Color myBlue = Color.fromARGB(255, 3, 155, 229);
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
      },
      onSaved: (String value) {
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
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Keep Email Format you@abc.com';
        }
      },
      onSaved: (String value) {
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
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'More 6 Charactor';
        }
      },
      onSaved: (String value) {
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
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
          registerFirebase();
        }
      },
    );
  }

  // Create Thread For upload email and Password to Authen of Firebase
  Future<void> registerFirebase() async {
    // Create Instance or Object

    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success');
      setUpDisplayName();
    }).catchError((response) {
      print('Error ==> ${response.toString()}');
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      // Create Route Without Arrow Back
      var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);



    });
  }

  Widget alertButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget showTitle(String titleString) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.red,
      ),
      title: Text(
        titleString,
        style: TextStyle(
          color: Colors.red[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void myAlert(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(titleString),
          content: Text(messageString),
          actions: <Widget>[alertButton()],
        );
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
