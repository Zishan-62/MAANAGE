import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maanage/Login/CompanyReg.dart';
import 'package:pinput/pinput.dart';

import 'login.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isLoading=false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final defaultPinTheme = PinTheme(
  //   width: 56,
  //   height: 56,
  //   textStyle: TextStyle(
  //       fontSize: 20,
  //       color: Color.fromRGBO(30, 60, 87, 1),
  //       fontWeight: FontWeight.w600),
  //   decoration: BoxDecoration(
  //     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
  //     borderRadius: BorderRadius.circular(20),
  //   ),
  // );

  var code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/maanage.png",
              scale: 2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            const Text("MAANAGE",
                textScaleFactor: 1.5,
                style: TextStyle(fontFamily: "Montserrat")),
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
                Text("OTP Verification ",
                    textScaleFactor: 2,
                    style: TextStyle(
                        fontFamily: "Montserrat.bold",
                        fontWeight: FontWeight.w500)),
                Text(
                  " OTP has been sent to +91**********",
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
                Pinput(
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.32,

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {

                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: Login.verify, smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);

                        // Navigator.pushNamed(context, 'login')
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'companyinfo', (route) => false);
                      } catch (e) {
                        print('Wrong OTP');
                      }
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
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFF3C5BFA)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text(
                    'Edit Phone Number?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
