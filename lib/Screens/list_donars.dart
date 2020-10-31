import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';

class ListOfBloodDonars extends StatefulWidget {

  final bloodGroup, location, date, time, bloodUnit, namePatient,userId;

  ListOfBloodDonars(
      {this.bloodGroup, this.location, this.date, this.time, this.bloodUnit, this.namePatient, this.userId});

  @override
  _ListOfBloodDonarsState createState() => _ListOfBloodDonarsState();
}

class _ListOfBloodDonarsState extends State<ListOfBloodDonars> {


  sendRequest({String myUserId}) async{


    await Firestore.instance.collection("Users").document(myUserId).updateData({
        "requested" : true,
    });

    await Firestore.instance.collection("Requests").document().setData({

         "sendByUserId" : widget.userId,
         "sendTo" : myUserId,
         "namePatient" : widget.namePatient,
         "bloodUnit" : widget.bloodUnit,
        "location" : widget.location,
         "date"  : widget.date,
         "time"  : widget.time,
         "timeStamp" : Timestamp.now(),
        "bloodGroup" : widget.bloodGroup,
        "status" : "notAccepted",


    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
            "Blood Donars",
             style: TextStyle(
               color: black,
             ),
        ),
      ),

      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection("Users").where("bloodGroup", isEqualTo: widget.bloodGroup).where("requested", isEqualTo: false).snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData ?  ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data.documents[index];
                return Container(
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
                                  doc['bloodGroup'],
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),

                              Container(
                                child: Text(
                                  doc['Name'],
                                  style: TextStyle(
                                      fontFamily: 'sf_pro_bold',
                                      fontSize: 18
                                  ),
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height: 8,),



                          SizedBox(height: 4,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(doc['address'] + " " + doc['city'] + doc['state'] ),
                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                color: Colors.green,
                                onPressed: (){
                                  sendRequest(myUserId: doc.documentID);
                                },
                                child: Text(
                                  "Request For Blood",
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              ),

                              RaisedButton(
                                onPressed: () {},
                                color: red,
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              )
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              }
            ) :Center(
              child: Container(
                child: Text("NO DONAR FOUND"),
              ),
            );
          }
        )
      ),


    );
  }
}
