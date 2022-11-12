//import 'dart:html';
//import 'dart:html';

//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class AddMeeting extends StatefulWidget {
  const AddMeeting({Key? key}) : super(key: key);

  @override
  State<AddMeeting> createState() => AddMeetingState();
}

class AddMeetingState extends State<AddMeeting> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Color(0xFFFFFFFF),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Color(0xFF373737),
            ),
          ),
          leadingWidth: 40,
          shape: Border(bottom: BorderSide(color: Color(0xFF3C5BFA), width: 3)),
          elevation: 4,
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          title: Row(
            children: <Widget>[
              Container(
                height: height * 0.04,
                width: width * 0.40,
                child: Align(
                  child: Text(
                    'LaundryGo',
                    style: TextStyle(
                      color: Color(0xFF373737),
                      fontSize: 18,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Container(
                width: width * 0.40,
                // margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Wed,03 AUG',
                        style: TextStyle(
                          color: Color(0xFF373737),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.centerRight,
                      //  width: width * 0.20,
                      // height: height * 0.02,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        //  crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '12:00 PM',
                              style: TextStyle(
                                color: Color(0xFF373737),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '(Start Now)',
                              style: TextStyle(
                                color: Color(0xFF4CB151),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
              height: height * 0.08,
              width: width * 1,
              color: Color(0xFFF5F5F5),
              child: Text(
                'Project Name',
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
              height: height * 0.08,
              width: width * 0.97,
              color: Color(0xFFF5F5F5),
              child: TextField(
                style: TextStyle(
                  color: Color(0xFF3C5BFA),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Project name',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              height: height * 0.08,
              width: width * 1,
              color: Color(0xFFF5F5F5),
              child: TextButton.icon(
                // <-- TextButton
                onPressed: () {},
                icon: Icon(
                  Icons.textsms,
                  size: 24,
                  color: Colors.black,
                ),
                label: Align(
                  child: Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
              height: height * 0.08,
              width: width * 0.97,
              color: Color(0xFFF5F5F5),
              child: TextField(
                style: TextStyle(
                  color: Color(0xFF3C5BFA),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Title',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              height: height * 0.08,
              width: width * 1,
              color: Color(0xFFF5F5F5),
              child: TextButton.icon(
                // <-- TextButton
                onPressed: () {},
                icon: Icon(
                  Icons.notes,
                  size: 24,
                  color: Colors.black,
                ),
                label: Align(
                  child: Text(
                    'Discription',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
              height: height * 0.33,
              width: width * 0.97,
              color: Color(0xFFF5F5F5),
              child: TextFormField(
                style: TextStyle(
                  color: Color(0xFF3C5BFA),
                ),
                minLines: 13,
                maxLines: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Discription',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              height: height * 0.08,
              width: width * 1,
              color: Color(0xFFF5F5F5),
              child: TextButton.icon(
                // <-- TextButton
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 24,
                  color: Colors.black,
                ),
                label: Align(
                  child: Text(
                    'Members',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 25,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: height * 0.085,
                  width: width * 0.4,
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                      decoration: BoxDecoration(
                        color: Color(0xFF3C5BFA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                          child: Text(
                            'Start Meeting',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          alignment: Alignment.center),
                    ),
                    //onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                    //  },
                    onTap: () {
                      Navigator.pushNamed(context, 'createmeeting');
                    },
                  ),
                ),
                Container(
                  height: height * 0.085,
                  width: width * 0.4,
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF4545),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          alignment: Alignment.center),
                    ),
                    //onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                    //  },
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            //     Container(
//
            //         margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //        child: CircleAvatar(
            //        backgroundColor: Colors.green,
            //        radius: 25,
            //      ),
            //   ),
          ],
        )),
      ),
    );
  }
}
