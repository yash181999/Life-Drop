import 'package:flutter/material.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/widgets/customButton.dart';
import 'package:versionbeta3/widgets/textField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool showPassword = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

      body: Container(
        padding: EdgeInsets.all(10),
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
              label: "Email/Phone",
              hint: "Email/Phone",
              type: TextInputType.emailAddress,
            ),

            CustomTextField(
              label: "Password",
              showHideText: showPassword ? false : true,
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

            ),

            SizedBox(
              height: 20,
            ),

            CustomButton(
              label: "Sign Up",
              color: red,
              labelColor: white,
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


    );
  }
}
