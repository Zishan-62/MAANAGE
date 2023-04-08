import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';

class Meetings extends StatefulWidget {
  const Meetings({super.key});

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  int index = 1;
  Color bgcolor = Color(0xFFF5F5F5);
  Color fontclr = Color(0xFF3C5BFA);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/projects.png',
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Meetings',
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 2,
        elevation: 1,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
          child: Row(children: [
            InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.325,
                child: Center(
                    child: Text('Today',
                        style: TextStyle(
                            color: index == 1 ? bgcolor : fontclr,
                            fontWeight: FontWeight.w500))),
                decoration:
                    BoxDecoration(color: index == 1 ? fontclr : bgcolor),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.333,
                decoration:
                    BoxDecoration(color: index == 2 ? fontclr : bgcolor),
                child: Center(
                    child: Text('Upcoming',
                        style: TextStyle(
                            color: index == 2 ? bgcolor : fontclr,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.333,
                decoration:
                    BoxDecoration(color: index == 3 ? fontclr : bgcolor),
                child: Center(
                    child: Text(
                  'Past',
                  style: TextStyle(
                      color: index == 3 ? bgcolor : fontclr,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ]),
        ),
        Container(
          height: height * 0.8,
          width: double.infinity,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xfff4f4f4),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      // color: Color(0xfff4f4f4),
                      width: double.infinity,

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => {
                                    Navigator.pushNamed(
                                        context, "editmeetdetail")
                                  },
                                  child: CustomText(
                                    text: 'LaundryGo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    textcolor: fontclr,
                                  ),
                                ),
                                CustomText(
                                  text: 'Wed, 03 AUG',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  textcolor: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    text: 'Admin Dashboard',
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start,
                                    textcolor: Colors.black,
                                    fontSize: 12),
                                CustomText(
                                    text: '12:00 AM',
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start,
                                    textcolor: Colors.black,
                                    fontSize: 12),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.024,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.,
                              children: [
                                // for(int i=0; i<RandomImages.length ; i++)
                                Row(
                                  children: [
                                    for (var i = 0; i < 3; i++)
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/Umar.jpeg"),
                                        radius: 25,
                                      ),
                                  ],
                                ),
                                Container(
                                  // alignment: Alignment.bottomRight,
                                  height: height * 0.06,
                                  width: width * 0.33,
                                  child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3C5BFA),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Align(
                                            child: Text(
                                              'Start Meeting',
                                              style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            alignment: Alignment.center),
                                      ),
                                      //onTap: (){
                                      //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                                      //  },
                                      onTap: () {
                                        //  validateReg,
                                        setState(() {});
                                      }),
                                ),
                                IconButton(
                                  color: Colors.red,
                                  iconSize: 45,
                                  icon: Icon(Icons.cancel),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )
                ]),
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3C5BFA),
        onPressed: () {
          Navigator.pushNamed(context, 'createmeeting');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
