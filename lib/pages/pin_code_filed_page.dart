import 'dart:async';

import 'package:flutter/material.dart';
import 'package:party_ui/pages/party_ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFieldPage extends StatefulWidget {
  const PinCodeFieldPage({Key? key}) : super(key: key);
  static const String id = "pin_code_filed_page";

  @override
  _PinCodeFieldPageState createState() => _PinCodeFieldPageState();
}

class _PinCodeFieldPageState extends State<PinCodeFieldPage> {
  final formKey = GlobalKey<FormState>();
  final String requiredNumber = "1234";
  String isCheck = "Enter pin number";
  bool _isCheck = true;
  int count = 59;

  Future<void> _timer()async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (count != 0) {
        setState(() {
          count -= 1;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP Verification",
                style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "An authentication code has been sent to",
                style: TextStyle(fontSize: 17.0, color: Colors.black),
              ),
              Text(
                "(+82) 10-4837-3663",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    errorTextSpace: 30,
                    length: requiredNumber.length,
                    // obscureText: true,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveFillColor: Colors.grey.shade300,
                      selectedFillColor: Colors.blue.shade500,
                      inactiveColor: Colors.grey.shade300,
                      selectedColor: Colors.grey.shade300,
                      activeColor: Colors.blue.shade500,
                      activeFillColor: Colors.blue.shade500,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(20),
                      fieldHeight: 70,
                      fieldWidth: 70,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                    onCompleted: (v) {
                      setState(() {
                        if (v == requiredNumber) {
                          Navigator.of(context).pushNamed(PartyUiPage.id);
                        } else {
                          isCheck = "plaese enter valid email";
                        }
                      });
                    },
                    onChanged: (value) {},
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "I didn't receive code.",
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Resend code",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(count>9?
                "0:$count Sec left":"0:0$count Sec left",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 140),
                child: MaterialButton(
                  shape: StadiumBorder(),
                  color: Colors.blue.shade700,
                  onPressed: () {},
                  minWidth: 300,
                  height: 50,
                  child: Text(
                    "Verify Now",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
