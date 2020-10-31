import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';


class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: 150,
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding:EdgeInsets.all(3) ,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        child: Text(
                            "A+",
                             style: TextStyle(
                               color: white,
                             ),
                        ),
                      ),
                      SizedBox(width: 5,),

                      Container(
                        child: Text(
                            "Yash Mehta",
                            style: TextStyle(
                              fontFamily: 'sf_pro_bold',
                              fontSize: 18
                            ),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 8,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date"),
                      Text("Time"),
                      Text("Location")
                    ],
                  ),

                  SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("4/6/2020"),
                      Text("14:35"),
                      Text("Nagpur"),
                    ],

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: Colors.green,
                        onPressed: (){},
                        child: Text(
                            "Accept Request",
                             style: TextStyle(
                               color: white,
                             ),
                        ),
                      ),

                      RaisedButton(
                        onPressed: (){},
                        child: Text(
                          "Reject Request",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),

                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
    );
  }
}
