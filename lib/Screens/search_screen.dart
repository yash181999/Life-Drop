
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:versionbeta3/Screens/list_donars.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';
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
  Color colorBlood = red;
  Color colorPlasma = Colors.white;

  final location = TextEditingController();
  String Blood_Group;
  String bloodOrPlasma = "Blood";
  final date = TextEditingController();
  final time = TextEditingController();
  final bloodUnit = TextEditingController();
  final patientName = TextEditingController();
  dynamic lat,long;

  String userId = "";

  final _formKey = GlobalKey<FormState>();


  getUserID() {
    AuthService.getUserIdSharedPref().then((value) {
       setState(() {
         userId = value;
       });
    });
  }


  dynamic getLocation() async {

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final coordinates = new Coordinates(
          position.latitude, position.longitude);
      final addresses = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);

      location.text += addresses.first.subAdminArea;
      date.text += DateTime.now().toString().split(' ')[0];
      time.text += DateTime.now().toLocal().hour.toString() +  ":" +  DateTime.now().toLocal().minute.toString();

      return addresses.first.featureName;

    }
    catch(e){
       print(e);
    }

  }

  sendBloodRequest() {

    Navigator.push(context, MaterialPageRoute(
       builder: (context) => ListOfBloodDonars(
         userId: userId,
         namePatient: patientName.text,
         bloodGroup: Blood_Group,
         time: time.text,
         bloodUnit: bloodUnit.text,
         location: location.text,
         date: date.text,
       ),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserID();
    getLocation();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(
          color: black,
        ),
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      )]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                             setState(() {
                               bloodOrPlasma = "Blood";
                               colorBlood = red;
                               colorPlasma = white;
                             });
                           },
                        child: Container(
                          color: colorBlood,
                          width: 165,
                          child: Center(
                            child: Text(
                              "Blood",
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
                            bloodOrPlasma = "Plasma";
                            colorPlasma = red;
                            colorBlood = white;
                          });
                        },
                        child: Container(
                          color: colorPlasma,
                          width: 165,
                          height: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Plasma",
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      )
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
                         setState(() {
                           Blood_Group = "AB-";
                           color1 = Colors.white;
                           color2 = Colors.white;
                           color3 = Colors.white;
                           color4 = Colors.white;
                           color5 = Colors.white;
                           color6 = Colors.white;
                           color7 = Colors.white;
                           color8 = red;
                         });
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

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CustomTextField(hint: "Enter your Location",
                      controller: location,
                      validator: (value) {
                        return value.isEmpty ? "Field should not be empty" : null;
                      },
                    )
                ),

                SizedBox(height: 20,),

                //CustomButton(color: red, label: "Search Donor", labelColor: white,),

                //SizedBox(height: 20,),

              //  CustomButton(label: "Emergency Search", labelColor: red, color: Colors.red[100],),

               // SizedBox(height: 20,),

                CustomTextField(hint: "Choose Date",  controller: date, validator: (value) {
                  return value.isEmpty ? "Field should not be empty" : null;
                },),

                SizedBox(height: 20,),

                CustomTextField(hint: "Enter Time",controller: time, validator: (value) {
                  return value.isEmpty ? "Field should not be empty" : null;
                },),

                SizedBox(height: 10,),

                (bloodOrPlasma == "Blood") ? CustomTextField(hint: "Blood Unit",type: TextInputType.number, controller: bloodUnit, validator: (value) {
                  return value.isEmpty ? "Field should not be empty" : null;
                },) : SizedBox(height: 0,),

                SizedBox(height: 20,),

                CustomTextField(hint: "Enter Name of the Patient", controller: patientName, validator: (value) {
                  return value.isEmpty ? "Field should not be empty" : null;
                },),

                SizedBox(height: 30,),



                CustomButton(
                  onPressed: (){
                      if(_formKey.currentState.validate()){
                        sendBloodRequest();
                      }

                    },
                  label: "Request For Blood", color: red, labelColor: Colors.white,
                ),

                SizedBox(height: 30,)




              ],
            ),
          ),
        ),
      ),
    );
  }
}
