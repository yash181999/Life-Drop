import 'package:flutter/material.dart';
import 'package:versionbeta3/Login/signup.dart';
import 'package:versionbeta3/Screens/main_screen.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/database/auth.dart';
import 'package:versionbeta3/database/firestore.dart';
import 'package:versionbeta3/widgets/appbar.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool showPassword = false;

  AuthService _auth = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool clickedLoginBtn = false;

  forgotPassword(){
  }

  login()  async{
    if(_formKey.currentState.validate()) {

      setState(() {
        clickedLoginBtn = true;
      });

      dynamic result = await _auth.signInUserWithEmailAndPassword(emailTEC.text, passwordTEC.text);


      if(result!=null) {
        dynamic userData = await databaseService.getUserDataFromFireStore(userId: result.toString());

        saveDataToSharedPrefStorage(userName: userData['name'], userId: result.toString(), profilePhoto: userData['profilePic']);


        Navigator.pushReplacement(context,  MaterialPageRoute(
            builder:  (context) => MainScreen()
        ));
      }

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
      //appbar..
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 22,
            color: black,
            fontFamily: 'sf_pro_bold',
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Welcome Back!",
                   style: TextStyle(
                     fontSize: 30,
                     color: black,
                     fontFamily: 'sf_pro_bold'
                   ),
                ),
              ),

              //email field
              CustomTextField(
                label : "Email/Phone",
                hint : "Email/Phone",
                controller: emailTEC,
                validator: (val) {
                  if(val.isEmpty) {
                    return "Email is empty";
                  }
                  if(!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(val)) {
                    return "Invalid Email";
                  }
                  return null;
                },
                type: TextInputType.emailAddress,
              ),

              //password field
              CustomTextField(
                label: "Password",
                hint: "Password",
                controller: passwordTEC,
                validator: (val) {

                  if(val.isEmpty) {
                    return "Password Is Empty";
                  }
                  if(val.length < 8) {
                    return 'Password must of at least 6 characters';
                  }
                  return null;

                },
                type: TextInputType.visiblePassword,
                showHideText : showPassword ? false : true,
                icon: GestureDetector(
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off
                  ),
                  onTap: (){
                    setState(() {
                        showPassword = !showPassword;
                    });
                  },
                ),

              ),


              InkWell(
                onTap: (){
                  forgotPassword();
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text("Forgot Password ?")
                ),
              ),


              SizedBox(
                height: 30,
              ),

             clickedLoginBtn == false ?  CustomButton(

                onPressed: (){
                  login();
                },
                label: "LOGIN",
                labelColor: white,
                color: red,

              ) : Container(alignment : Alignment.center,child: CircularProgressIndicator()),


              SizedBox(height: 30,),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Don't have a account? Sign up",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),


              SizedBox(height: 20,),


              CustomButton(

                onPressed: (){},
                color: Colors.red,
                labelColor: white,
                label: "EMERGENCY",

              ),

           ],
          ),
        ),
      ),


    );
  }
}
