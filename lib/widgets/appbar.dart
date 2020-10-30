import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText;
  CustomAppBar({this.titleText = "Title"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: 22,
          color: black,
          fontFamily: 'sf_pro_bold',
        ),
      ),
    );
  }
}
