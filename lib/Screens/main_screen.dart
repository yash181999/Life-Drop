import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/widgets/appbar.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
         appBar: AppBar(
           elevation: 0,
           backgroundColor: white,
           title: Text(
             "Find Donor",
             style: TextStyle(
               fontSize: 25,
               color: black,
               fontFamily: 'sf_pro_bold',
             ),
           ),
         ),

         body: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search for blood donor around you",
                    style: TextStyle(
                       color: Colors.grey,
                    )
                  ),

                  SizedBox(height: 25,),

                  Text(
                      "Choose Blood Group",
                      style: TextStyle(
                        color: Colors.grey,
                      )
                  ),

                  SizedBox(height: 20,),


                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      )]
                    ),
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                              "A+",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                                "A-",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                                "B-",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                                "O+",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                                "O-",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),


                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                            color: Colors.black38,
                            blurRadius: 3,
                          offset: Offset(0, 3),
                        )]
                    ),
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                              "AB+",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                              "B+",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          child: Center(
                            child: Text(
                              "AB-",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66.0,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 66.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                   SizedBox(height: 20,),

                    Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5),
                         ),
                        child: CustomTextField(hint: "Enter your Location", )
                    ),

                    SizedBox(height: 40,),

                    CustomButton(color: red, label: "Search Donor", labelColor: white,),

                    SizedBox(height: 20,),

                    CustomButton(label: "Emergency Search", labelColor: red, color: Colors.red[100],)

                ],
              ),
    ),
         ),
    );
  }
}
