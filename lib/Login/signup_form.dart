import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:versionbeta3/Login/uploadDocument.dart';
import 'package:versionbeta3/Login/verification_code_screen.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';
import 'package:versionbeta3/database/firestore.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/red_button.dart';
import 'package:versionbeta3/widgets/textField.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {


  DatabaseService databaseService = DatabaseService();


  DateTime selectedDate = DateTime.now();

  String countryCode ="+91";

  final dobController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final aadharController = TextEditingController();
  final addressController = TextEditingController();
  final cityController =TextEditingController();
  final stateController = TextEditingController();
  bool clickedNextBtn = false;
  final _formKey = GlobalKey<FormState>();
  String userId = '';


  initState(){
    super.initState();
    getUserIdFromSharedPref();
  }

  getUserIdFromSharedPref() async{

     await AuthService.getUserIdSharedPref().then((value) {
             setState(() {
               userId = value;
             });
      });

  }



  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1960),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,

    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }



  saveDataToFireStore() async{
     if(_formKey.currentState.validate()) {
       setState(() {
         clickedNextBtn = true;

       });

       await databaseService.saveUserDetailsFireStore(
         userId: userId,
         name: nameController.text,
         aadharNumber:  aadharController.text,
         address:  addressController.text,
         city:  cityController.text,
         state: stateController.text,
         dateOfBirth: selectedDate,
         phoneNumber: phoneController.text,
       );

       setState(() {
         clickedNextBtn = false;
       });

       Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => UploadDocument()
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
              "Blood Donation Details",
              style: TextStyle(
                color: black,
              ),
            ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    label: "Full Name",
                    validator: (value){
                      if(value.isEmpty) {
                        return "Value should not be empty";
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    label: "Phone Number",
                    type: TextInputType.phone,
                    controller: phoneController,
                    validator: (value) {
                      if(value.length > 10 && value.length<10) {
                        return "Invalid Phone Number";
                      }
                      if(value.isEmpty) return "Field should not be empty";
                      return null;
                    },
                  ),

                  CustomTextField(
                    controller: aadharController,
                    label: "Aadhar Number",
                    type: TextInputType.number,
                    validator: (value){
                      if(value.isEmpty) return "Field should not be empty";
                      return null;
                    },
                  ),

                  CustomTextField(
                    controller: addressController,
                    label: "Address",
                    type: TextInputType.streetAddress,
                    validator: (value){
                      if(value.isEmpty) return "Field should not be empty";
                      return null;
                    },
                  ),

                  CustomTextField(
                    label: "City",
                    controller: cityController,
                    validator: (value){
                      if(value.isEmpty) return "Field should not be empty";
                      return null;
                    },
                  ),

                  CustomTextField(
                    controller: stateController,
                    label: "State",
                    validator: (value){
                      if(value.isEmpty) return "Field should not be empty";
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),


                  RaisedButton(
                    onPressed: () => _selectDate(context), // Refer step 3
                    child: Text(
                      'Pick  date of Birth',
                      style:
                      TextStyle(color: white, fontWeight: FontWeight.bold),
                    ),
                    color:grey,
                  ),



                  SizedBox(height: 50,),

                 clickedNextBtn == false ?  Container(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      onPressed: () {
                        saveDataToFireStore();
                      },
                       label: "Next>>",
                       color: red,
                       labelColor: white,
                    ),
                  ) : CircularProgressIndicator()


                ],
              ),
            ),
          ),
        ),
    );
  }
}
