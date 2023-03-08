import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maanage/Login/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String verify = '';
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
  bool isLoading = false;
  var phone = '';
  Future login() async {
    var headers = {
      'x-api-key': 'taibah123456',
      'Cookie': 'ci_session=b7168d388478fd9c66906f30c7bd2295da3ec528'
    };
    var request =  http.MultipartRequest('POST',
        Uri.parse('https://softdigit.in/softdigits/api/Login/no_login'));
    request.fields.addAll({'mobile_no': '${countrycode.text + phone}'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
 var data2 ;
      var data=await response.stream.bytesToString();
      data2=await json.decode(data);
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
     
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${countrycode.text + phone}',
        verificationCompleted: (PhoneAuthCredential credential) {
          setState(() {
            isLoading = false;
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          const snackdemo = SnackBar(
            content: Text(
              'Verification failed please try later',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Color.fromARGB(255, 237, 237, 237),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          Login.verify = verificationId;
          isLoading = false;
          sharedprf(data2);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OtpPage()));
          setState(() {
            isLoading = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      print(response.reasonPhrase);
      const snackdemo = SnackBar(
        content: Text(
          'User is not registered please contact Admin',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromARGB(255, 237, 237, 237),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      setState(() {
        isLoading = false;
      });
    }
  }

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
              padding: const EdgeInsets.only(bottom: 45.0),
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
                  child: Image.asset(
                    'assets/images/maanageasbg.png',
                    opacity: AlwaysStoppedAnimation(.5),
                  ),
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                          ),
                        )),
                    // bich mae gap kae liyae
                    Text(
                      '|',
                      style: TextStyle(fontSize: 40, color: Colors.grey),
                    ),
                    //phone no kae liyae
                    Expanded(
                        child: TextFormField(
                      // maxLength: 10,
                      onChanged: (value) {
                        phone = value;
                      },
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 10 ||
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
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      // await FirebaseAuth.instance.verifyPhoneNumber(
                      //   phoneNumber: '${countrycode.text + phone}',
                      //   verificationCompleted:
                      //       (PhoneAuthCredential credential) {
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      //   },
                      //   verificationFailed: (FirebaseAuthException e) {
                      //     const snackdemo = SnackBar(
                      //       content: Text(
                      //         'Verification failed please try later',
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       backgroundColor: Color.fromARGB(255, 237, 237, 237),
                      //       elevation: 10,
                      //       behavior: SnackBarBehavior.floating,
                      //       margin: EdgeInsets.all(5),
                      //     );
                      //     ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      //   },
                      //   codeSent: (String verificationId, int? resendToken) {
                      //     Login.verify = verificationId;
                      //     isLoading = false;
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => OtpPage()));
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      //   },
                      //   codeAutoRetrievalTimeout: (String verificationId) {},
                      // );
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3C5BFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: isLoading
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              CustomText(
                                text: 'Loading',
                                textcolor: Colors.white,
                                fontSize: 24,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : Text(
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
  sharedprf(details)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    await pref.setString('fname', details['data']['first_name']);
    await pref.setString('lname', details['data']['last_name']);
    await pref.setString('email', details['data']['email']);
    await pref.setString('phone', details['data']['phone']);

  }
}
