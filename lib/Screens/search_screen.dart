import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class Search_screen extends StatefulWidget {
  @override
  _Search_screenState createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {
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
  final Date = TextEditingController();
  final Time = TextEditingController();
  final Blood_unit = TextEditingController();
  final patient_name = TextEditingController();
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
                          color2 = Colors.white;
                          color3 = Colors.white;
                          color4 = Colors.white;
                          color5 = Colors.white;
                          color6 = Colors.white;
                          color7 = Colors.white;
                          color8 = Colors.white;
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
                          color1 = Colors.white;
                          color2 = red;
                          color3 = Colors.white;
                          color4 = Colors.white;
                          color5 = Colors.white;
                          color6 = Colors.white;
                          color7 = Colors.white;
                          color8 = Colors.white;
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
                          color1 = Colors.white;
                          color2 = Colors.white;
                          color3 = red;
                          color4 = Colors.white;
                          color5 = Colors.white;
                          color6 = Colors.white;
                          color7 = Colors.white;
                          color8 = Colors.white;
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
                          color1 = Colors.white;
                          color2 = Colors.white;
                          color3 = Colors.white;
                          color4 = red;
                          color5 = Colors.white;
                          color6 = Colors.white;
                          color7 = Colors.white;
                          color8 = Colors.white;
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
                          color1 = Colors.white;
                          color2 = Colors.white;
                          color3 = Colors.white;
                          color4 = Colors.white;
                          color5 = red;
                          color6 = Colors.white;
                          color7 = Colors.white;
                          color8 = Colors.white;
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
                          color1 = Colors.white;
                          color2 = Colors.white;
                          color3 = Colors.white;
                          color4 = Colors.white;
                          color5 = Colors.white;
                          color6 = red;
                          color7 = Colors.white;
                          color8 = Colors.white;
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
                          color1 = Colors.white;
                          color2 = Colors.white;
                          color3 = Colors.white;
                          color4 = Colors.white;
                          color5 = Colors.white;
                          color6 = Colors.white;
                          color7 = red;
                          color8 = Colors.white;
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
                        color1 = Colors.white;
                        color2 = Colors.white;
                        color3 = Colors.white;
                        color4 = Colors.white;
                        color5 = Colors.white;
                        color6 = Colors.white;
                        color7 = Colors.white;
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

              SizedBox(height: 20,),

              //CustomButton(color: red, label: "Search Donor", labelColor: white,),

              //SizedBox(height: 20,),

            //  CustomButton(label: "Emergency Search", labelColor: red, color: Colors.red[100],),

             // SizedBox(height: 20,),

              CustomTextField(hint: "Choose Date",  controller: Date,),

              SizedBox(height: 20,),

              CustomTextField(hint: "Enter Time",controller: Time,),

              SizedBox(height: 20,),

              CustomTextField(hint: "Blood Unit", controller: Blood_unit,),

              SizedBox(height: 20,),

              CustomTextField(hint: "Enter Name of the Patient", controller: patient_name,),

              SizedBox(height: 30,),

              CustomButton(label: "Request For Blood", color: red, labelColor: Colors.white,),

              SizedBox(height: 30,)




            ],
          ),
        ),
      ),
    );
  }
}
