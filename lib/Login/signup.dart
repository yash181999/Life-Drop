import 'package:flutter/material.dart';
import 'package:versionbeta3/Login/signup_form.dart';
import 'package:versionbeta3/Screens/main_screen.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';
import 'package:versionbeta3/database/firestore.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool showPassword = false;
  AuthService _auth = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool clickedSignUpBtn = false;
  


      signUp() async{
         if(_formKey.currentState.validate()) {

            setState(() {
              clickedSignUpBtn = true;
            });


            await _auth.registerWithEmailAndPassword(
                email: emailTEC.text,password: passwordTEC.text)
                .then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder:   (context) => SignUpForm(),
              ));
            });

         }
       }



  void saveDataToSharedPrefStorage({String userName, String userId, String profilePhoto}) async {
    await AuthService.saveUserIdSharedPref(userId);
    await  AuthService.saveUserNameSharedPref(userName);
    await AuthService.saveUserLoggedInSharedPref(true);
    await AuthService.saveProfilePhotoSharedPref(profilePhoto);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "SignUp",
          style: TextStyle(
            fontSize: 22,
            color: black,
            fontFamily: 'sf_pro_bold',
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Create An Account!",
                    style: TextStyle(
                        fontSize: 30,
                        color: black,
                        fontFamily: 'sf_pro_bold'
                    ),
                  ),
                ),

                CustomTextField(
                  controller: emailTEC,
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Value should not be empty";
                    }
                    if(!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value)) {
                      return "Invalid Email";
                    }
                    else return null;

                  },
                  label: "Email/Phone",
                  hint: "Email/Phone",
                  type: TextInputType.emailAddress,
                ),

                CustomTextField(
                  label: "Password",
                  controller: passwordTEC,
                  showHideText: showPassword ? false : true,
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Field cannot be empty";
                    }
                    if(value.toString().length<8) {
                      return "Password should be of 8 characters";
                    }
                    return null;
                  },
                  icon: GestureDetector(
                    onTap: (){
                      setState(() {
                        showPassword = !showPassword;
                      });

                    },


                    child: Icon(
                      showPassword  ? Icons.visibility_off : Icons.visibility,
                    ),

                  )
                ),

                CustomTextField(
                    label: "Confirm Password",
                    hint: "ConfirmPassword",
                    showHideText: true,
                    controller: confirmPasswordTEC,
                    validator: (value) {
                      if(value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if(passwordTEC.text!=confirmPasswordTEC.text) {
                        return "Both passwords should match";
                      }
                      return null;
                    },

                ),

                SizedBox(
                  height: 20,
                ),

                clickedSignUpBtn == false ? CustomButton(
                  onPressed: (){
                    signUp();
                  },
                  label: "Sign Up",
                  color: red,
                  labelColor: white,
                ) : Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()
                ),

                SizedBox(height: 30,),

                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Already have an Account? Sign In",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ),
        ),
      ),


    );
  }
}
