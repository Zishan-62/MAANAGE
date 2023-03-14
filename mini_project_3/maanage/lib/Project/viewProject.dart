// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unnecessary_new, unnecessary_const
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';

class ViewProject extends StatefulWidget {
  const ViewProject({super.key});

  @override
  State<ViewProject> createState() => _ViewProjectState();
}

class _ViewProjectState extends State<ViewProject> {
  // FOR  start date
  TextEditingController _dateofjoin = TextEditingController();
  // FOR due Date
  TextEditingController _dateofcontract = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  bool projectvisible = false;
  bool datevisible = false;
  bool commentvisible = false;
  bool attachvisible = false;
  bool descripvisible = false;
  bool labelvisible = false;
  bool activityvisible = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ))
          ],
          title: CustomText(
            text: "Wisetech",
            textcolor: Colors.black,
          ),
          shadowColor: Color(0xFF3C5BFA),
          backgroundColor: Color(0xffffffff),
          leading: IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //project widget
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        child: Text(
                          'Project Name',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              projectvisible = !projectvisible;
                            });
                          },
                          icon: Icon(Icons.add),
                          color: Color(0xFF3C5BFA),
                        ),
                      )
                    ],
                  ),
                ),
                //project visibilty
                Visibility(
                  visible: projectvisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, right: 10),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (var i = 0; i < 5; i++)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 7,
                                    top: MediaQuery.of(context).size.height *
                                        0.015,
                                    right: 7),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF4F4F4),
                                      borderRadius: BorderRadius.circular(20)),
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.024,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              child: Image.asset(
                                                  'assets/images/office.png'),
                                            ),
                                            IconButton(
                                                splashColor: Colors.white,
                                                onPressed: () {},
                                                icon: Icon(
                                                    color: Color(0xFF3C5BFA),
                                                    Icons.more_vert))
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                              left: 10),
                                          child: CustomText(
                                            text: 'Website Building',
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.start,
                                            textcolor: Color(0xFF3C5BFA),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(text: 'hello'),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.013,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.035),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Card(
                                                  elevation: 5,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: CustomText(
                                                      text: '15 days\n    left',
                                                      textcolor:
                                                          Color(0xFF3C5BFA),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                // Description widget
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Icon(Icons.description_rounded),
                      Spacer(
                        flex: 1,
                      ),
                      Align(
                        child: Text(
                          'Description',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              descripvisible = !descripvisible;
                            });
                          },
                          icon: Icon(Icons.edit),
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                //Description visibilty

                Visibility(
                  visible: descripvisible,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Container(
                      child: TextField(
                        maxLines: null,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff)),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
                // LABEL WIDGET
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Icon(Icons.label),
                      Spacer(
                        flex: 1,
                      ),
                      Align(
                        child: Text(
                          'Labels',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              labelvisible = !labelvisible;
                            });
                          },
                          icon: Icon(Icons.add),
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                // LABEL VISIBILITY
                Visibility(
                  visible: labelvisible,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 0.05,
                              width: width * 0.25,
                              decoration: BoxDecoration(
                                  color: Color(0xffff4545),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: CustomText(
                                text: "URGENT",
                                textcolor: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.001,
                ),

                //MEMBER WIDGET

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Icon(Icons.perm_contact_calendar_outlined),
                      Spacer(
                        flex: 1,
                      ),
                      Align(
                        child: Text(
                          'Members',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              commentvisible = !commentvisible;
                            });
                          },
                          icon: Icon(Icons.add),
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                //COMMENT VISIBILITY
                Visibility(
                  visible: commentvisible,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: Container(
                              width: width * 0.8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.5, color: Color(0xfff4f4f4)),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/zishan.jpg"),
                                    radius: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Flexible(
                                      child: TextFormField(
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        hintText: "Add Comment "),
                                  )),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.send)),
                                ],
                              )),
                        ),
                        SizedBox(width: width * 0.05),
                        Flexible(
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.link)))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (var i = 0; i < 10; i++)
                          Padding(
                            padding: EdgeInsets.only(left: 7, top: 7, right: 7),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/Umar.jpeg"),
                              radius: MediaQuery.of(context).size.height * 0.04,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.010),

                // DATES WIDGET

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Icon(Icons.date_range_outlined),
                      Spacer(
                        flex: 1,
                      ),
                      Align(
                        child: Text(
                          'Dates',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              datevisible = !datevisible;
                            });
                          },
                          icon: Icon(Icons.add),
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                    ],
                  ),
                ),

                //DATE visibilty

                Visibility(
                  visible: datevisible,
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            readOnly: true,
                            style: TextStyle(
                                color: Color(0xFF3C5BFA),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                            controller: _dateofjoin,
                            decoration: InputDecoration(
                                hintText: 'Start Date',
                                suffixIcon: Icon(Icons.calendar_today_rounded),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                hintStyle: TextStyle(fontFamily: "Montserrat"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            onTap: () async {
                              DateTime? pickedDOJdate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100));

                              if (pickedDOJdate != null) {
                                setState(() {
                                  _dateofjoin.text = DateFormat('dd-MM-yyyy')
                                      .format(pickedDOJdate);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            readOnly: true,
                            style: TextStyle(
                                color: Color(0xFF3C5BFA),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500),
                            controller: _dateofcontract,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today_rounded),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                hintText: 'Due Date',
                                hintStyle: TextStyle(fontFamily: "Montserrat"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            onTap: () async {
                              DateTime? pickedEOCdate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100));

                              if (pickedEOCdate != null) {
                                setState(() {
                                  _dateofcontract.text =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedEOCdate);
                                });
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),

                // ATTACHMENT WIDGET

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Icon(Icons.attachment_outlined),
                      Spacer(
                        flex: 1,
                      ),
                      Align(
                        child: Text(
                          'Attachments',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              attachvisible = !attachvisible;
                            });
                          },
                          icon: Icon(Icons.add),
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                    ],
                  ),
                ),
                //ATTACHMENT visibilty

                Visibility(
                    visible: attachvisible,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          // IMAGE ATTACHMENT
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color(0xfff4f4f4),
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                            height: height * 0.08,
                            width: width * 1,
                            // color: Color(0xFFFfffff),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Align(
                                  child: Text(
                                    'Image Attachment',
                                    style: TextStyle(
                                      color: Color(0xFF373737),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Spacer(
                                  flex: 20,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          // FIGMA LINK
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                              color: Color(0xfff4f4f4),
                            )),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                            height: height * 0.08,
                            width: width * 1,
                            // color: Color(0xFFF5F5F5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.,
                              children: [
                                Icon(Icons.link),
                                Spacer(
                                  flex: 1,
                                ),
                                Align(
                                  child: Text(
                                    'Figma Link',
                                    style: TextStyle(
                                      color: Color(0xFF373737),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Spacer(
                                  flex: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.more_horiz),
                                    color: Color(0xFF3C5BFA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          // screen Ideas
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 2,
                              color: Color(0xfff4f4f4),
                            )),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                            height: height * 0.08,
                            width: width * 1,
                            child: Row(
                              children: [
                                Icon(Icons.link),
                                Spacer(
                                  flex: 1,
                                ),
                                Align(
                                  child: Text(
                                    'Screen Ideas',
                                    style: TextStyle(
                                      color: Color(0xFF373737),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Spacer(
                                  flex: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.more_horiz),
                                    color: Color(0xFF3C5BFA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                // ACTIVITY WIDGET
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
                  height: height * 0.08,
                  width: width * 1,
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Align(
                        child: Text(
                          'Activity',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Spacer(
                        flex: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              activityvisible = !activityvisible;
                            });
                          },
                          icon: Icon(Icons.more_horiz),
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                    ],
                  ),
                ),
                //activity visibilty

                Visibility(
                  visible: activityvisible,
                  child: Container(
                    height: height * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, INDEX) {
                          return new Card(
                            child: const ListTile(
                              leading: const Icon(Icons.album),
                              title: const Text('my name IS zishan'),
                              subtitle: const Text(
                                'Music by Julie Gable. Lyrics by Sidney Stein.',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
                //first column ending
              ],
            ),
          ),
        ));
  }
}
