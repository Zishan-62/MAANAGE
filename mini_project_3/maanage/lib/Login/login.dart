import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maanage/Login/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  static String verify='';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginAppBarState();
}

class _LoginAppBarState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  TextEditingController countrycode = TextEditingController();
  var phone='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/Group.png',
              scale: 2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:45.0),
              child: const Text("MAANAGE",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontFamily: "Montserrat")),
            ),
          ],
        ),
        toolbarHeight: 130,
        centerTitle: true,
        backgroundColor: Color(0xFF3C5BFA),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.width * 0.05),
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("LOGIN / REGISTER ",
                    textScaleFactor: 2,
                    style: TextStyle(
                        fontFamily: "Montserrat.bold",
                        fontWeight: FontWeight.w500)),
                Text(
                  "We need to register your phone number before getting started !",
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontSize: 7,
                    fontFamily: "Montserrat.bold",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset('assets/images/maanageasbg.png',opacity: AlwaysStoppedAnimation(.5),),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    //country code
                    SizedBox(
                      
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextFormField(
                          style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.phone,
                          controller: countrycode,
                          decoration: InputDecoration(border: InputBorder.none,
                          filled: true,
                        fillColor: Color(0xFFF4F4F4),),
                        )),
                    // bich mae gap kae liyae
                    Text(
                      '|',
                      style: TextStyle(fontSize: 40, color: Colors.grey),
                    ),
                    //phone no kae liyae
                    Expanded(
                        child: TextFormField(
                            onChanged: (value) {
                              phone=value;
                            },
                          style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                          //  r'^[0-9]{10}$' pattern plain match number with length 10
                          return "Enter Correct Phone Number";
                        } else {
                          return "Mobile must contain 10 Digit";
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4F4),
                        border: InputBorder.none,
                        hintText: 'Enter Mobile Number',
                        hintStyle: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ))
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () async { await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '${countrycode.text+phone}',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {Login.verify=verificationId;
    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage() ));},
  codeAutoRetrievalTimeout: (String verificationId) {},
);
                       
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3C5BFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    
                    child: Text(
                      "CONTINUE ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Montserrat"),
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
