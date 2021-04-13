import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PatientInfo extends StatefulWidget {
  PatientInfo({Key key}) : super(key: key);
  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreen[300],
              Color(0xFF7FB45E),
            ],
          ),
        ),
      ),
    );
  }
}