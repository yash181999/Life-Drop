import 'package:flutter/material.dart';

import 'package:versionbeta3/Screens/chatbot.dart';
import 'package:versionbeta3/color/color.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(
          color: black,
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Center(
          child: Text(
            "Story",
            style: TextStyle(
              fontSize: 25,
              color: black,
              fontFamily: 'sf_pro_bold',
            ),
          ),
        ),

        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.post_add,
                  size: 26.0,
                ),
              )
          ),
        ],

      ),


        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
             padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
             width: MediaQuery.of(context).size.width,
            child: Column(
               children: [
                 GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBot()));
                   },
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       color: white,
                       boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 10,offset: Offset(0.0,0.0),)],
                       borderRadius: BorderRadius.circular(20),
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: AssetImage('assets/undraw_chat_bot_kli5.png'),
                       ),
                     ),
                     height: 200,
                     child: Center(
                       child: Text(
                         "Health Bot",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20
                         ),
                       ),
                     ),
                   ),
                 ),

                 SizedBox(height: 10,),
                 PostCard(imgurl: "assets/2.png", desc: "plaease donate blood",),

                 SizedBox(height: 10,),
                 PostCard(imgurl: "assets/2.png", desc: "donate blood",),

                 SizedBox(height: 10,),
                 PostCard(imgurl: "assets/2.png", desc: "world blood donate day",)




            ],
            ),
          ),
        ),
    );
  }
}


class PostCard extends StatelessWidget {
  String imgurl , desc;
  PostCard({this.imgurl , this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 10,offset: Offset(0.0,0.0),)],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('$imgurl'),
              ),
            ),
            height: 200,
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "$desc",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
              ),
            ),
          )
        ],
      ),
    );
  }
}
