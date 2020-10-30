import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final dynamic label,hint,icon,showHideText,type,validator;
  CustomTextField({this.label, this.hint,this.icon,this.showHideText = false,this.type,this.validator});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        validator: validator,
        obscureText: showHideText,
        keyboardType: type,
        decoration: InputDecoration(

            labelText: label,
            hintText: hint,
            border: UnderlineInputBorder(

            ),
            suffixIcon: icon,



        ),
      ),
    );
  }
}
