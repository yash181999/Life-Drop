import 'package:flutter/material.dart';
import 'package:versionbeta3/Login/signup_form.dart';
import 'package:versionbeta3/Login/uploadDocument.dart';
import 'package:versionbeta3/Screens/main_screen.dart';
import 'package:versionbeta3/color/color.dart';

import 'Screens/all_requests/all_requests.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: red,
      ),
      home: AllRequests(),
    );
  }
}
