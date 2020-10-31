import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';

class UploadDocument extends StatefulWidget {
  @override
  _UploadDocumentState createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text(
            "Upload Your Blood Report",
            style: TextStyle(
              color: black,
            ),
          ),
        ),

       body: Container(
         child: Column(

         ),
       ),

    );
  }
}
