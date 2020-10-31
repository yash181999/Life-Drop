import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final Location = TextEditingController();
  String Blood_Group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
      ),
    );
  }
}
