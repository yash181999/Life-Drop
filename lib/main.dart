import 'package:flutter/material.dart';
import 'package:versionbeta3/Login/login.dart';
import 'package:versionbeta3/Screens/all_requests/all_requests.dart';
import 'package:versionbeta3/Screens/main_screen.dart';
import 'package:versionbeta3/Screens/request_screen.dart';
import 'package:versionbeta3/Screens/search_screen.dart';
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

        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
