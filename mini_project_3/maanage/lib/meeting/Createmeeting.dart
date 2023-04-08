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
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
        _startTimeController.text = _startTime!.format(context);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
        _endTimeController.text = _endTime!.format(context);
      });
    }
  }

  String? _validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    final time = TimeOfDay.fromDateTime(DateTime.parse('2000-01-01 $value'));
    if (time == null) {
      return 'Invalid time format';
    }
    return null;
  }

  String? _validateAndSubmit(String? value) {
    if (_startTime == null || _endTime == null) {
      // show error message, both fields are required
      return "wrong";
    }
    if (_startTime!.hour > _endTime!.hour ||
        (_startTime!.hour == _endTime!.hour &&
            _startTime!.minute >= _endTime!.minute)) {
      // show error message, start time should be before end time
      return "wrong";
    }
    // proceed with submitting the form
  }

  @override
  void initState() {
    super.initState();
    _startTimeController.addListener(() {
      setState(() {
        _startTime = TimeOfDay.fromDateTime(
            DateTime.parse('2000-01-01 ${_startTimeController.text}'));
      });
    });
    _endTimeController.addListener(() {
      setState(() {
        _endTime = TimeOfDay.fromDateTime(
            DateTime.parse('2000-01-01 ${_endTimeController.text}'));
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
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
              onPressed: null,
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
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
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (var i = 0; i < 10; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/Umar.jpeg"),
                            radius: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Positioned(
                              top: -14,
                              left: 27,
                              child: IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.cancel),
                                onPressed: () {},
                              ))
                        ],
                      ),
                    )
                ],
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff4f4f4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff4f4f4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
              onPressed: null,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Container(
                          // height: height * 0.8,
                          width: width * 0.4,
                          // margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
                          child: TextFormField(
                              validator: _validateAndSubmit,
                              readOnly: true,
                              style: TextStyle(
                                  color: Color(0xFF3C5BFA),
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                              controller: _startTimeController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfff4f4f4)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfff4f4f4)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: Icon(Icons.access_time),
                                  hintText: 'Start Time',
                                  hintStyle:
                                      TextStyle(fontFamily: "Montserrat"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Color(0xfff4f4f4)))),
                              onTap: () {
                                _selectStartTime(context);
                              }),
                        ),

                        // IconButton(
                        //   onPressed: _showTimerPicker,
                        //   icon: Icon(
                        //     Icons.access_time_outlined,
                        //   ),
                        // ),
                      ],
                    )),
              ),
              Container(
                // height: height * 0.8,
                width: width * 0.4,
                // margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
                child: TextFormField(
                  validator: _validateAndSubmit,
                  readOnly: true,
                  style: TextStyle(
                      color: Color(0xFF3C5BFA),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                  controller: _endTimeController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff4f4f4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff4f4f4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.access_time),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      hintText: 'End Time',
                      hintStyle: TextStyle(fontFamily: "Montserrat"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Color(0xfff4f4f4)))),
                  onTap: () {
                    _selectEndTime(context);
                  },
                ),
              ),
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
            child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff4f4f4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff4f4f4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
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
