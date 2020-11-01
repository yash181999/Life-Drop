import 'package:flutter/material.dart';
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


        body: Container(
           padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
           width: MediaQuery.of(context).size.width,
          child: Column(
             children: [
               Container(
                 decoration: BoxDecoration(
                   color: white,
                   boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 10,offset: Offset(0.0,0.0),)],
                   borderRadius: BorderRadius.circular(20),
                   image: DecorationImage(
                     image: AssetImage(),
                   ),
                 ),
                 height: 30,
                 child: ,
               )
             ],
          ),
        ),
    );
  }
}
