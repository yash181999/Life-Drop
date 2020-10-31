import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';

class ReceivedRequests extends StatefulWidget {
  @override
  _ReceivedRequestsState createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<ReceivedRequests> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }
  String userId = "";
  getUserId() {
    AuthService.getUserIdSharedPref().then((value) {
       setState(() {
         userId = value;
       });
    });
  }

  acceptRequest({dynamic docId}) async{
     await Firestore.instance.collection("Requests").document(docId).updateData({
       "status"  : "accepted",
     });
  }

  rejectRequest({dynamic docId}) async{
    await Firestore.instance.collection("Requests").document(docId).updateData({
      "status"  : "rejected",
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection("Requests").where("sendTo", isEqualTo: userId).snapshots(),
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
                                      doc['namePatient'],
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
                                  Text(doc['date']),
                                  Text(doc['time']),
                                  Text(doc['location']),
                                ],

                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  doc['status'] == "notAccepted" ? RaisedButton(
                                    color: Colors.green,
                                    onPressed: (){
                                      acceptRequest(docId : doc.documentID);
                                    },
                                    child: Text(
                                      "Accept Request",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ): RaisedButton(
                                    color: Colors.green,
                                    onPressed: (){},
                                    child: Text("Chat",style: TextStyle(
                                      color: white,
                                    ),),
                                  ),

                                 doc['status'] == 'notAccepted'  ?  RaisedButton(
                                    onPressed: (){
                                      rejectRequest(docId: doc.documentID);
                                    },
                                    child: Text(
                                      "Reject Request",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ): Text("Rejected By You")

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
                  child: Text("NO Requests FOUND"),
                ),
              );
            }
        )
    );
  }
}
