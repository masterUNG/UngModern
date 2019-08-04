import 'package:flutter/material.dart';

class AddValue extends StatefulWidget {
  @override
  _AddValueState createState() => _AddValueState();
}

class _AddValueState extends State<AddValue> {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      child: Text('Add Value',style: TextStyle(fontSize: 30.0),),
    );
  }
}
