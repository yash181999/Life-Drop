import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';

class Chat extends StatefulWidget {
  final docId, userId,name;
  Chat({this.docId, this.userId, this.name});


  @override
  _ChatState createState() => _ChatState();
}


class _ChatState extends State<Chat> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkForChat();
  }

  final messageInsert = TextEditingController();
  List<Map> messages = List();

  String docId = "";

  checkForChat() async{
    setState(() {
      docId = widget.userId + "_" + widget.docId;
    });
    String anotherDocId = widget.docId + "_" + widget.userId;

    await Firestore.instance.collection("Chats").getDocuments().then((value) {

      for(int i=0;i<value.documents.length;i++) {
        if(value.documents[i].documentID == anotherDocId){
          setState(() {
            docId = anotherDocId;
          });
        }
      }


    });
  }

  sendMessage({String message}) async{
    checkForChat();

    await Firestore.instance.collection("Chats").document(docId).collection("chat").document().setData({

         "sentBy" : widget.userId,
         "sentTo" : widget.docId,
         "message" : message,
         "timeStamp" : Timestamp.now(),
         "sentByName" : widget.name,


    });
  }

  call() {

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
        ),
        backgroundColor: red,
        actions: [
          IconButton(
            onPressed: (){
              call();
            },
            icon: Icon(
              Icons.add_call,
              color: white,
            ),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: StreamBuilder(
                  stream: Firestore.instance.collection("Chats").document(docId).collection("chat").orderBy("timeStamp", descending  :true).snapshots(),

                  builder: (context, snapshot) {
                    return snapshot.hasData  ? ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {

                          DocumentSnapshot documentSnapShot = snapshot.data.documents[index];

                           if( documentSnapShot['sentBy'] == widget.userId )  return chat(
                             documentSnapShot['message'], 1
                          ); else if(documentSnapShot['sentTo'] == widget.userId) return chat(documentSnapShot['message'],0);
                          return Container();
                        }
                    ) : Container();
                  }
                )
            ),
            Divider(
              height: 5.0,
              color: Colors.blueAccent,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                        style: TextStyle(
                            fontFamily: 'sf_pro_bold',
                            fontSize: 18.0
                        ),
                        controller: messageInsert,
                        decoration: InputDecoration.collapsed(
                            hintText: "Ask Me Something",
                            hintStyle: TextStyle(
                                fontFamily: 'sf_pro_bold',
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(

                        icon: Icon(

                          Icons.send,
                          size: 30.0,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            sendMessage(message : messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.green : Colors.blue,
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                      message.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),

                SizedBox(height: 5,),
                data == 0 ? Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,child: Text(widget.name)) : Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,child: Text("You")),

              ],
            ),
          )),
    );
  }
}

