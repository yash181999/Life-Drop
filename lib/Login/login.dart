import 'package:flutter/material.dart';
import 'package:versionbeta3/Login/signup.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/widgets/appbar.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool showPassword = false;

  forgotPassword(){

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
                type: TextInputType.emailAddress,
              ),

              //password field
              CustomTextField(
                label: "Password",
                hint: "Password",
                type: TextInputType.visiblePassword,
                showHideText : showPassword ? true : false,
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

              CustomButton(

                onPressed: (){},
                label: "LOGIN",
                labelColor: white,
                color: red,

              ),


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

              )





           ],
          ),
        ),
      ),


    );
  }
}
