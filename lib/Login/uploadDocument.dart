
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:versionbeta3/Screens/main_screen.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';
import 'package:versionbeta3/widgets/customButton.dart';

class UploadDocument extends StatefulWidget {
  @override
  _UploadDocumentState createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {


  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;
  Color color5 = Colors.white;
  Color color6 = Colors.white;
  Color color7 = Colors.white;
  Color color8 = Colors.white;

  File file;
  bool warningImage;
  bool warningText;
  bool clickedBtn = false;

  String Blood_Group = "A+";



  checkWarning() {
    if(file == null)  {
      setState(() {
        warningImage = true;
      });
    }
    else{
      setState(() {
        warningImage = false;
      });
    }
    if(Blood_Group == null) {
      warningText = true;

    }
    else{
      setState(() {
        warningText = false;
      });
    }

  }

  String userId;

  getUserDataFromLocal() async{

    await AuthService.getUserIdSharedPref().then((value) {
      if(value!=null){
        print(userId);
        setState(() {
          userId =  value;
        });

      }
      else{
        print("NBull");
      }
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDataFromLocal();
  }



  uploadImage() async {
    checkWarning();
    if (warningImage == false && warningText == false) {
      setState(() {
        clickedBtn = true;
      });
      StorageUploadTask image = FirebaseStorage.instance.ref().child("Activity")
          .
      child(userId).child(Timestamp.now().toString()).child("Image")
          .putFile(file);

      final StorageTaskSnapshot imageDownloadUrl =
      (await image.onComplete);
      final String imageFile = await imageDownloadUrl.ref.getDownloadURL();


      await Firestore.instance.collection("Users").document(userId).updateData({

        "bloodReport": imageFile,
        "timeStamp": Timestamp.now(),
        "bloodGroup" : Blood_Group,

      });

      Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => MainScreen()
      ));

    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text(
            "Upload Your Blood Report",
            style: TextStyle(
              color: black,
            ),
          ),
        ),

       body: Container(
         child: Column(

           children: [

             Container(
               padding: EdgeInsets.all(10),
               child: Text(
                   "Choose Blood Group",
                   style: TextStyle(
                     color: black,
                     fontSize: 18
                   )
               ),
             ),

             SizedBox(height: 10,),


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

             file != null ? Container(
               height: 300,
               width: 300,
               child: Image(image: FileImage(file),),
             ):Container(),

             warningText == true ? Text("Please Upload an Image",style: TextStyle(color: Colors.red),) : Container(),


             SizedBox(height: 10,),

             RaisedButton(
               color: file ==null ?  Colors.green  : Colors.red,
               onPressed: ()async {
                 if(file==null) {
                   File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

                   setState(() {
                     file = File(imageFile.path);
                   });

                 }
                 else{
                   setState(() {
                     file = null;
                   });
                 }
               },
               child: file==null ? Text("Upload Blood Report",style: TextStyle(color: Colors.white),) :
               Text("Remove Image", style :  TextStyle(color: Colors.white)),
             ),

             SizedBox(height: 20,),

             clickedBtn == false ? Container(
               padding: EdgeInsets.all(10),
               child: CustomButton(
                 color: red,
                 onPressed: (){uploadImage();},
                 labelColor: white,
                 label: "Submit",
               ),
             ) : Container(
               alignment: Alignment.center,
                 child: CircularProgressIndicator()),

           ],

         ),
       ),

    );
  }
}
