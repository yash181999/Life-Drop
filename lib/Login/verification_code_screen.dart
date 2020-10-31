import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versionbeta3/Screens/main_screen.dart';
import 'package:versionbeta3/color/color.dart';
import 'package:versionbeta3/widgets/red_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerificationCode extends StatefulWidget {

  final phone,otp;
  VerificationCode(this.phone,this.otp);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {



  String mobileNo = "+9127453421";
  int OTPText = 0;


  bool verify(){
    return widget.otp.resultChecker(OTPText);
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 130,),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.email,
                    color: red,
                    size: 100,
                  ),

                  SizedBox(height: 5,),

                  Text("Verification Code" ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  ),

                  SizedBox(height: 4,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter the OTP sent to",
                        style: TextStyle(
                          color: Colors.black38
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "${widget.phone}",
                        style: TextStyle(
                          color: red,
                          fontSize: 12
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 2,),
            
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 40),
              width: 250,
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                keyboardType: TextInputType.numberWithOptions(),
                obscureText: false,
                textStyle: TextStyle(
                    fontFamily: "sFproR",
                    fontSize: 20
                ),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                pinTheme: PinTheme(
                  disabledColor: red,
                  activeColor: red,
                  selectedColor: red,
                  inactiveColor: red,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 40,
                  fieldWidth: 30,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: false,
                // errorAnimationController: errorController,
                // controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                     OTPText = int.parse(value);
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),


            SizedBox(height: 40,),

            InkWell(
                onTap: (){
                  bool result = verify();
                  print(result);
                },
                child: RedButton(
                  btnTitle: "Verify",
                  textColor: Colors.white,
                  btnColor: red,
                )
            ),

            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the OTP?",
                   style: TextStyle(
                     color: Colors.black38
                   ),
                ),

                 SizedBox(width: 5,),

                Text(
                  "RESEND OTP",
                  style: TextStyle(
                    color: red,
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                ),
              ],
            )

            ]
        ),
      ),
    );
  }
}


