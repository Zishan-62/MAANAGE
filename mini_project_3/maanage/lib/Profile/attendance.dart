// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final rowSpacer = TableRow(children: [
      SizedBox(
        height: height * 0.02,
      ),
      SizedBox(
        height: height * 0.02,
      ),
      SizedBox(
        height: height * 0.02,
      ),
      SizedBox(
        height: height * 0.02,
      )
    ]);
    return Table(
      children: [
        TableRow(children: [
          Container(
            height: height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xfff4f4f4),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text("Date",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3c5bfa)))),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text("Clock In",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3c5bfa)))),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text("Clock out",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3c5bfa)))),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xfff4f4f4),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Working Hrs",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3c5bfa)),
                )),
            width: double.infinity,
          ),
        ]),
        rowSpacer,
        TableRow(children: [
          Flexible(
            child: Container(
              height: height * 0.055,

              decoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfff4f4f4),
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text("17",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))),
                  Align(
                      alignment: Alignment.center,
                      child: Text("MON",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ],
              ),
              // width: double.infinity,
            ),
          ),
          Container(
            height: height * 0.055,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text("08:50 am",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text("Office",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)))
              ],
            ),
            width: double.infinity,
          ),
          Container(
            height: height * 0.055,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text("04:20 pm",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text("Office",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)))
              ],
            ),
            width: double.infinity,
          ),
          Container(
            height: height * 0.055,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "07:10 Hrs",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3c5bfa)),
                )),
            width: double.infinity,
          ),
        ]),
        rowSpacer,
        TableRow(children: [
          Container(
            height: height * 0.055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xfff4f4f4),
            ),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: height * 0.055,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text("Weekend:",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff373737)))),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: height * 0.055,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("16 Sunday",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff373737)))),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: height * 0.055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xfff4f4f4),
            ),
            width: double.infinity,
          ),
        ]),
      ],
    );
  }
}
