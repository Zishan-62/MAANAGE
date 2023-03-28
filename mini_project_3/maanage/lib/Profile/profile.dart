// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// import 'attendace.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import 'edit_profile.dart';
import 'attendance.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 12, vsync: this)
      ..addListener(() {
        setState(() => _tabIndex = tabController.index);
      });
  }

  List month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  int index = 0;
  int value = 0;

  //for selected Year Attendance
  TextEditingController _Yeardate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0,
        leading: Image.asset('assets/images/logo.png'),
        title: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.075),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Icon(
                Icons.location_on,
                color: Color(0xFF3C5BFA),
              ),
              Expanded(child: Text('Masjid bandar'))
            ],
          ),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
        ),
        backgroundColor: Colors.white,
        shape: Border(
            bottom: BorderSide(
                color: Color(0xff3C5BFA),
                width: MediaQuery.of(context).size.width * 0.005)),
        actions: [
          Image.asset('assets/images/coolicon.png'),
          Image.asset('assets/images/layer.png')
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.009),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/zishan.jpg',
                          ),
                          // foregroundColor: Colors.grey,
                          backgroundColor: Colors.grey,
                          radius: 60,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Sorathiya Mohamed Zishan',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3C5BFA),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Developer    ',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF373737),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.16,
                              decoration: BoxDecoration(
                                  color: Color(0xFF3C5BFA),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(6)),
                              child: InkWell(
                                  onTap: () => {},
                                  child: Icon(
                                    Icons.task_sharp,
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Tasks',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            )
                          ]),
                          Column(children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.16,
                              decoration: BoxDecoration(
                                  color: Color(0xFF3C5BFA),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(6)),
                              child: InkWell(
                                  onTap: () => {},
                                  child: Icon(
                                    Icons.file_open,
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Projects',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            )
                          ]),
                          Column(children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.16,
                              decoration: BoxDecoration(
                                  color: Color(0xFF3C5BFA),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(6)),
                              child: InkWell(
                                  onTap: () => {},
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            )
                          ]),
                          Column(children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.16,
                              decoration: BoxDecoration(
                                  color: Color(0xFF3C5BFA),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(6)),
                              child: InkWell(
                                  onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile()))
                                      },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'EditProfile',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            ),
                          ]),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //attendance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "ATTENDANCE",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    // flex: 2,
                    child: Container(
                      // height: 50,
                      height: height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        readOnly: true,
                        style: TextStyle(
                            color: Color(0xFF3C5BFA),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500),
                        controller: _Yeardate,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today_rounded),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            // hintText: 'Enter DOB',
                            hintStyle: TextStyle(fontFamily: "Montserrat"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.blue))),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(DateTime.now().year),
                              firstDate: DateTime(DateTime.now().year - 100, 1),
                              lastDate: DateTime(DateTime.now().year + 100, 1));

                          if (pickeddate != null) {
                            setState(() {
                              _Yeardate.text =
                                  DateFormat('yyyy').format(pickeddate);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // SizedBox(
              //   height: height * 0.06,
              //   width: double.infinity,
              //   child: ListView.builder(
              //       physics: BouncingScrollPhysics(),
              //       itemCount: month.length,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               current == index;
              //             });
              //           },
              // child: AnimatedContainer(
              //   duration: Duration(milliseconds: 300),
              //   margin: EdgeInsets.all(5),
              //   width: width * 0.19,
              //   height: 40,
              //   decoration: BoxDecoration(
              //       border: current == index
              //           ? null
              //           : Border.all(
              //               color: Color(0xFF3C5BFA), width: 2),
              //       borderRadius: BorderRadius.circular(10),
              //       color: current == index
              //           ? Color(0xFF3C5BFA)
              //           : Colors.white),
              //   child: Center(
              //     child: Text(
              //       month[index],
              //       style: TextStyle(
              //           color: current == index
              //               ? Colors.white
              //               : Color(0xFF3C5BFA)),
              //     ),
              //             ),
              //            ),
              //         );
              //       }),
              // )
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Color(
                          0xfff4f4f4,
                        ),
                        width: 5)),
                child: Column(
                  children: [
                    Container(
                        height: height * 0.06,
                        child: TabBar(
                          isScrollable: true,
                          indicator: BoxDecoration(
                              color: Color(0xFF3C5BFA),
                              borderRadius: BorderRadius.circular(4)),
                          controller: tabController,
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xFF3C5BFA),
                          tabs: month
                              .map((month) => Container(
                                    padding: EdgeInsets.all(10),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Color(0xff3c5bfa),
                                            width: 1)),
                                    child: Text(month),
                                  ))
                              .toList(),
                        )),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                      height: height * 0.7,
                      child: TabBarView(
                          controller: tabController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                            Attendance(),
                          ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
