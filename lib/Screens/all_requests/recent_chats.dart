import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';

import '../chat.dart';

class RecentChats extends StatefulWidget {
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  String userId = '';

  getUserId() {
    AuthService.getUserIdSharedPref().then((value) {

       setState(() {
         userId = value;
       });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
            "Recent Chats",
            style: TextStyle(
              color: black,
            ),

        ),
        backgroundColor: white,

      ),
      body: Container (
        child: StreamBuilder(
          stream: Firestore.instance.collection("Chats").
             orderBy("timeStamp",descending: true).
          where("sentBy",isEqualTo: userId).
          where("sentTo",isEqualTo: userId).snapshots(),

          builder: (context, snapshot) {
            return snapshot.hasData ? ListView.builder(

              itemCount: snapshot.data.documents.length,

              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data.documents[index];
                return snapshot.hasData ? Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Chat(
                            userId: userId,
                            docId: doc["sentTo"],
                            name: doc['name'],
                          ),
                        ));
                      },
                      child: Container(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white54,
                          child: Row(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 25,

                                ),
                              ),

                              SizedBox(width: 10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doc['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'sf_pro_semi_bold',
                                    ),
                                  ),

                                  SizedBox(height: 2,),

                                  Text(doc['lastMessage'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'sf_pro_regular',
                                    ),
                                  ),


                                ],
                              ),

                              Spacer(),

                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(doc['timeStamp'].toDate().toString().split(' ')[0]),
                              )

                            ],
                          ),


                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                  ],
                ): Container();
              }
            ) : Container();
          }
        ),
      ),
    );
  }
}
