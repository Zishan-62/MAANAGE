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
        ListView(shrinkWrap: true,
          children: [
            Column(
              children: [Padding(
                padding:  EdgeInsets.only(top:20.0),
                child: Container(width: MediaQuery.of(context).size.width*0.90,
                height: MediaQuery.of(context).size.width*0.45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Row(children: 
                    [Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(text: 'LaundryGo',fontWeight: FontWeight.bold,fontSize: 25,textcolor:fontclr ,),
                    )],)
                  ]),
                ),
              )],
            )
          ],
        )
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'createmeeting');
      },child: Icon(Icons.add),
      ),
    );
  }
}
