// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:maanage/Login/login.dart';
import 'package:maanage/dashboard/ongoing_project.dart';

import 'package:maanage/dashboard/ongoing_task.dart';
import 'package:maanage/dashboard/team_leaders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../custom widgets/Custom_text.dart';
import '../custom widgets/custom_container.dart';
// import '../meeting/Addmeeting.dart';
import '../meeting/Createmeeting.dart';
import '../meeting/meeting.dart';

// ignore: camel_case_types
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;
  List entry = ['Clock in', 'Clock out'];
  var entry1 = 'Clock in';
  int counter = 0;
  String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
  Color _color = Colors.red;
  var isClicked = true;
  late Timer _timer;
  late String starttimer = "00:00";
  late String stoptimer = '00:00';
  int _currentIndex = 0;
  Color done_meeting_color = Colors.white;
  Color left_meeting_color = Colors.white;
  //  For location
  String _currentAddress = '';
  Position? _currentPosition;
  bool isWeatherClick = false;
  bool isLocationClick = false;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        isLocationClick = true;
      });
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        print(place);
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
    _timer = Timer.periodic(
        const Duration(milliseconds: 1000), (timer) => _update());
  }

  void _update() {
    setState(() {
      formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  // Creating the start timer
  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        if (started = true) {
          digitSeconds = (seconds >= 10) ? '$seconds' : '0$seconds';
          digitMinutes = (minutes >= 10) ? '$minutes' : '0$minutes';
          digitHours = (hours >= 10) ? '$hours' : '0$hours';

          if (digitHours == '08' ||
              digitHours == '09' ||
              digitHours == '10' ||
              digitHours == '11' ||
              digitHours == '12' ||
              digitHours == '13' ||
              digitHours == '14') {
            _color = Colors.green;
          } else {
            _color = Colors.red;
          }
        }
      });
    });
  }

  // Creating the stop
  void stop() {
    timer!.cancel();

    setState(() {
      started = false;
    });
  }

  removeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => Login()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 10,
        leading: Image.asset('assets/images/logo.png'),
        title: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.075),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(_currentAddress)));
            },
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Icon(
                  Icons.location_on,
                  color: Color(0xFF3C5BFA),
                ),
                Expanded(child: Text(_currentAddress))
              ],
            ),
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
          InkWell(
              onTap: () {
                removeData();
              },
              child: Image.asset('assets/images/coolicon.png')),
          Image.asset('assets/images/layer.png')
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: const Center(
                child: Text(
                  'Good Morning, Admin!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.03,
                  left: MediaQuery.of(context).size.width * 0.025),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.04)),
              child: Row(
                children: <Widget>[
                  //Top side se left wala bluebox
                  Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.41,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF3C5BFA),
                          border: Border.all(
                            color: Colors.blue,
                          )),
                      //Box k andar ka saaman
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.032),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  //bluebox wala time jo am/pm me likha hai
                                  Text(
                                    formattedTime,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        fontSize: 25),
                                  ),
                                  //bluebox me jo date likha hai vo
                                  Text(
                                    DateFormat('MMM d,yyyy')
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  // Bluebox me jo button hai vo
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.015),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        (!started) ? start() : stop();
                                        setState(() {
                                          if (isClicked) {
                                            print(_currentAddress);
                                            isClicked = !isClicked;
                                            entry1 = entry[1];
                                            starttimer = formattedTime;
                                            done_meeting_color =
                                                Color(0xFF00A410);
                                            left_meeting_color = Colors.red;
                                          } else {
                                            _color = Colors.red;
                                            isClicked = !isClicked;
                                            entry1 = entry[0];
                                            stoptimer = formattedTime;

                                            done_meeting_color = Colors.white;
                                            left_meeting_color = Colors.white;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        entry1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  // left side wala box blue box k baju wala
                  Container(
                      margin: EdgeInsets.only(right: 1),
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.47,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03),
                            child: Text(
                              'Your important meetings',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3C5BFA)),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 5,
                          ),
                          // Today wala container jo blue color me hai
                          Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.015),
                              decoration: BoxDecoration(
                                  color: Color(0xFF3C5BFA),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.006,
                                    left: MediaQuery.of(context).size.width *
                                        0.04,
                                    right: MediaQuery.of(context).size.width *
                                        0.04,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.007),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Meetings()));
                                  },
                                  child: Text('Today',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                            Text('02  ',
                                style: TextStyle(
                                    color: done_meeting_color,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                            Text('left ',
                                style: TextStyle(
                                    color: left_meeting_color,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14)),
                            Text('01',
                                style: TextStyle(
                                    color: left_meeting_color,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18))
                          ]),
                          Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFF3C5BFA),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01,
                                    left: MediaQuery.of(context).size.width *
                                        0.04,
                                    right: MediaQuery.of(context).size.width *
                                        0.04,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Text('Upcoming',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            const Text('02',
                                style: TextStyle(
                                    color: Color(0xFF3C5BFA),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                          ])
                        ],
                      )),
                ],
              ),
            ),
            // Uppar pehela column khatam
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            // abb new column chalu stopwatch wala
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(children: <Widget>[
                        // Red wala box jis k working hours likha hai
                        Container(
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                                color: _color,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'working hours',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '$digitHours:$digitMinutes:$digitSeconds Hrs',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                        // Red box k baju wala (clock in aur clock out)
                        // clock in wala
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            children: [
                              const Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 18.0),
                                child: Text('clock in',
                                    style: TextStyle(
                                        color: Color(0xFF3C5BFA),
                                        fontWeight: FontWeight.w500)),
                              )),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(starttimer,
                                    style: TextStyle(
                                        color: Color(0xFF3C5BFA),
                                        fontWeight: FontWeight.w500)),
                              )),
                            ],
                          ),
                        ),
                        // Clock out wala
                        Container(
                          width: (MediaQuery.of(context).size.width * 0.25),
                          child: Column(
                            children: [
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 18.0),
                                child: CustomText(
                                  text: 'clock out',
                                  textcolor: Color(0xFF3C5BFA),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: CustomText(
                                    text: stoptimer,
                                    textcolor: const Color(0xFF3C5BFA),
                                    fontWeight: FontWeight.w500),
                              )),
                            ],
                          ),
                        ),
                      ])),
                )),
            SizedBox(
              width: double.infinity,
              height: 8,
            ),
            // 3rd column chalu hoga team leaders wala

            TeamLeaders(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            OngoingTask(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            OngoingProject(),
            // Department ongoing_project wale file me he hai
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Department(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ],
        ),
      ),
//  floatingActionButton:  FloatingActionButton(backgroundColor: Color(0xFF3C5BFA),onPressed: () {
//                   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const AddMeeting()),
//   );
//                 },child: Icon(Icons.add,),),
    );
  }
}
