import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';
//import 'package:flutter/cupertino.dart';

class CreateMeeting extends StatefulWidget {
  // const CreateMeeting({Key? key}) : super(key: key);

  @override
  State<CreateMeeting> createState() => CreateMeetingState();
}

class CreateMeetingState extends State<CreateMeeting> {
  TimeOfDay _timeOfDay = TimeOfDay(hour: 10, minute: 30);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  void _showTimerPicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  void showsectimepicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  // TextEditingController timeinput = TextEditingController();
  // TimeOfDay _timeOfDay = TimeOfDay(hour: 10, minute: 30);
  // TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
//  DateTime date = DateTime(24, 12, 2022);
  // set timer
  final format = DateFormat('hh:mm');
  List<String> items = <String>[
    '5 mins before meeting',
    '10 mins before meeting',
    '15 mins before meeting',
  ];
  String dropdownValue = '5 mins before meeting';
  //@override
  //void initState() {
  //  timeinput.text = ""; //set initial value of text field
  // super.initState();
  //}
  TextEditingController _dateS = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Color(0xFFFFFFFF),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Color(0xFF373737),
            ),
          ),
          // leadingWidth: 10,
          shape: Border(bottom: BorderSide(color: Color(0xFF3C5BFA), width: 3)),
          elevation: 4,
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          title: Text(
            "CREATE MEETING",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          )),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
            height: height * 0.08,
            width: width * 1,
            color: Color(0xFFF5F5F5),
            child: Text(
              'Select Project',
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
            color: Color(0xFFFFFFFF),
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
              label: Text(
                'Title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            height: height * 0.08,
            width: width * 0.97,
            color: Color(0xFFFFFFFF),
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
              label: Text(
                'Discription',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            height: height * 0.33,
            width: width * 0.97,
            color: Color(0xFFFFFFFF),
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
            color: Color(0xFFF5F5F5),
            height: height * 0.08,
            width: width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  //  height: height * 0.08,
                  //  width: width * 0.1,
                  color: Color(0xFFF5F5F5),
                  child: TextButton.icon(
                    // <-- TextButton
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Members',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(200, 0, 20, 0),
                  alignment: Alignment.centerRight,
                  // color: Colors.deepPurple,
                  height: 40,
                  width: 40,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF3C5BFA),
                          size: 30,
                        ),
                      ),
                    ),
                    //onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                    //  },
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  // width: width * 0.5,
                  height: height * 0.13,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 25,
                  ),
                ),
                Container(
                  height: height * 0.13,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 25,
                  ),
                ),
                Container(
                  height: height * 0.13,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 25,
                  ),
                ),
              ],
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
                Icons.date_range,
                size: 24,
                color: Colors.black,
              ),
              label: Text(
                'Date',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.08,
            width: width * 0.97,
            // height: height * 0.085,
            // width: width * 0.97,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            child: TextFormField(
              readOnly: true,
              style: TextStyle(
                  color: Color(0xFF3C5BFA),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500),
              controller: _dateS,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today_rounded),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  hintText: 'Select Date',
                  hintStyle: TextStyle(fontFamily: "Montserrat"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.blue))),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if (pickeddate != null) {
                  setState(() {
                    _dateS.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                  });
                }
              },
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
                Icons.access_time,
                size: 24,
                color: Colors.black,
              ),
              label: Text(
                'Timings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.blue,
                margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFFFFFFF)),
                width: width * 0.4,
                height: height * 0.085,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_timeOfDay.format(context).toString()),
                        IconButton(
                          onPressed: _showTimerPicker,
                          icon: Icon(
                            Icons.access_time_outlined,
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                  //  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFFFFFF)),
                  width: width * 0.4,
                  height: height * 0.085,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      //50 , 10 , 10 ,10
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(time.format(context).toString()),
                          IconButton(
                            onPressed: showsectimepicker,
                            icon: Icon(
                              Icons.access_time_outlined,
                            ),
                          ),
                        ],
                      )))
            ],
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
                Icons.access_alarms,
                size: 24,
                color: Colors.black,
              ),
              label: Text(
                'Set Remainder',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            //  height: height*0.3,
            //  width: width*,
            //  width: MediaQuery.of(context).size.width*0.2,
            //  width: width*0.1,

            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            height: height * 0.08,
            width: width * 0.97,
            color: Color(0xFFFFFFFF),
            child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down),
                iconEnabledColor: Color(0xFF3C5BFA),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                value: dropdownValue,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       alignment: Alignment.centerLeft,
          //       height: height * 0.085,
          //       width: width * 0.4,
          //       child: InkWell(
          //         child: Container(
          //           margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
          //           decoration: BoxDecoration(
          //             color: Color(0xFF3C5BFA),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Align(
          //               child: Text(
          //                 'Submit',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               alignment: Alignment.center),
          //         ),
          //         //onTap: (){
          //         //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
          //         //  },
          //         onTap: () {},
          //       ),
          //     ),
          //     Container(
          //       height: height * 0.085,
          //       width: width * 0.4,
          //       alignment: Alignment.bottomRight,
          //       child: InkWell(
          //         child: Container(
          //           margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
          //           decoration: BoxDecoration(
          //             color: Color(0xFFFF4545),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Align(
          //               child: Text(
          //                 'Cancel',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               alignment: Alignment.center),
          //         ),
          //         //onTap: (){
          //         //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
          //         //  },
          //         onTap: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ])
      ]),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      alignment: Alignment.center),
                ),
                //onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                //  },
                onTap: () {},
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
      ],
    );
  }
}

//  Container(
//   alignment: Alignment.topLeft,
//  margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
//   height: 50,
//   width: 400,
//   color: Color(0xFFF4F4F4),
// child: CupertinoDatePicker(
//   mode: CupertinoDatePickerMode.date,
//   initialDateTime: DateTime(1969, 1, 1),
//   onDateTimeChanged: (DateTime newDateTime) {
// Do something
//   },
//   ),
//),

//     ],
//    )),
//   ),
// );
// }
//}
