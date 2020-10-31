import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class Request_screen extends StatefulWidget {
  @override
  _Request_screenState createState() => _Request_screenState();
}

class _Request_screenState extends State<Request_screen> {

  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;
  Color color5 = Colors.white;
  Color color6 = Colors.white;
  Color color7 = Colors.white;
  Color color8 = Colors.white;

  final Location = TextEditingController();
  String Blood_Group;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Find Donor",
          style: TextStyle(
            fontSize: 27,
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
              SizedBox(height: 5,),
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
                height: 60,
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
                    InkWell(
                      onTap : () {
                        setState(() {
                          Blood_Group = "A+";
                          color1 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color1,
                        child: Center(
                          child: Text(
                            "A+",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          Blood_Group = "A-";
                          color2 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color2,
                        child: Center(
                          child: Text(
                            "A-",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          Blood_Group = "B-";
                          color3 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color3,
                        child: Center(
                          child: Text(
                            "B-",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          Blood_Group = "O+";
                          color4 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color4,
                        child: Center(
                          child: Text(
                            "O+",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          Blood_Group = "O-";
                          color5 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color5,
                        child: Center(
                          child: Text(
                            "O-",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),


              Container(
                height: 60,
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
                    InkWell(
                      onTap :() {
                        setState(() {
                          Blood_Group = "AB+";
                          color6 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color6,
                        child: Center(
                          child: Text(
                            "AB+",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          Blood_Group = "B+";
                          color7 = red;
                        });
                      },
                      child: Container(
                        width: 66.0,
                        color: color7,
                        child: Center(
                          child: Text(
                            "B+",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Blood_Group = "AB-";
                        color8 = red;
                      },
                      child: Container(
                        width: 66.0,
                        color: color8,
                        child: Center(
                          child: Text(
                            "AB-",
                            style: TextStyle(
                                fontSize: 20
                            ),
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
                  child: CustomTextField(hint: "Enter your Location", controller: Location, )
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
