// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maanage/Login/login.dart';
import 'package:maanage/Login/splashScreen.dart';
// import 'package:maanage/Project.dart';
import 'package:maanage/Project/viewProject.dart';
import 'package:maanage/Task/addTask.dart';
import 'package:maanage/Task/task.dart';
// import 'package:maanage/Report.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';
import 'package:maanage/employees/employee.dart';
import 'package:maanage/employees/seemoreleader.dart';
import 'package:maanage/meeting/editMeetingDetail.dart';
// import 'package:maanage/employees/seeMoreEmployeedart';
import './dashboard/dashboard.dart';
import 'Login/CompanyReg.dart';
// import 'Profile/edit_profile.dart';
import 'Profile/profile.dart';
import 'Project/projects.dart';
import 'employees/seeMoreEmployee.dart';
import 'global.dart';
import 'meeting/Createmeeting.dart';
// import 'meeting/MeetingDetail.dart';
import 'package:firebase_core/firebase_core.dart';
import './Project/AddProject.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAANAGE',

      //   theme: ThemeData(primarySwatch:  Colors.blue,colorScheme: ColorScheme.fromSwatch().copyWith(
      // secondary: Color(0xFF3C5BFA)),

      //   ),
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF3C5BFA),
            ),
      ),
      routes: {
        'login': (context) => Login(),
        'companyinfo': (context) => CompanyReg(),
        'createmeeting': (context) => CreateMeeting(),
        'addproject': (context) => AddProject(),
        'project': (context) => ProjectPage(),
        'moreemployee': (context) => MoreEmployee(),
        "seemoreleader": (context) => SeeMoreLeader(),
        "viewproject": (context) => ViewProject(),
        'splashScreen': (context) => Splash(),
        'profile': (context) => Profile(),
        'editmeetdetail': (context) => EditMeetDetail(),
        'addtask': (context) => AddTask(),
      },
      initialRoute: 'splashScreen',
      // home:  Login(),
    );
  }
}

class MaterialMain extends StatefulWidget {
  const MaterialMain({super.key});

  @override
  State<MaterialMain> createState() => _MaterialState();
}

class _MaterialState extends State<MaterialMain> {
  int _currentIndex = 0;
  bool isLoading = false;
  @override
  void initState() {
    EmpolyeeDetails();

    // TODO: implement initState
    super.initState();
  }

  EmpolyeeDetails() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'x-api-key': 'taibah123456',
      'Cookie': 'ci_session=31f54ddc7643f3c5a1487d5346a2411a92e77e93'
    };
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'https://softdigit.in/softdigits/api/Authentication/userlist/${appr_id}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    Employeedata = json.decode(data);
    if (response.statusCode == 200) {
      print(Employeedata);
      setState(() {
        isLoading = false;
      });
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  final screen = [
    DashBoard(),
    MyEmployee(),
    ProjectPage(),
    // AddMeeting(),
    Task(),
    Profile()
  ];
  late final ShapeBorder? indicatorShape;
  @override
  Widget build(BuildContext context) {
    var Mwidth = MediaQuery.of(context).size.width;
    var Mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: isLoading == true
            ? Center(child: CircularProgressIndicator())
            : IndexedStack(
                index: _currentIndex,
                children: <Widget>[...screen],
              ),
        bottomNavigationBar: buildMyNavBar(context)
        // NavigationBarTheme(
        //   data: NavigationBarThemeData(

        //       // indicatorShape: ShapeBorder,
        //       indicatorColor: Colors.blueAccent,
        //       labelTextStyle: MaterialStateProperty.all(TextStyle(
        //           color: const Color(0xFF3C5BFA),
        //           fontSize: 12,
        //           fontWeight: FontWeight.w500))),
        //   child: NavigationBar(
        //     destinations: [
        //       NavigationDestination(
        //         // selectedIcon: Container(
        //         //   C
        //         // ),
        //         icon: Icon(
        //           Icons.home,
        //           color: _currentIndex == 0 ? Colors.white : Color(0xFF3C5BFA),
        //         ),
        //         label: 'Home',
        //       ),
        //       NavigationDestination(
        //         icon: Icon(
        //           Icons.person_outline,
        //           color: _currentIndex == 1 ? Colors.white : Color(0xFF3C5BFA),
        //         ),
        //         label: 'Employees',
        //       ),
        //       // NavigationDestination(
        //       //   icon: Icon(
        //       //     Icons.assessment_outlined,
        //       //     color: _currentIndex == 2 ? Colors.white : Color(0xFF3C5BFA),
        //       //   ),
        //       //   label: 'Report',
        //       // ),
        //       NavigationDestination(
        //         icon: Icon(
        //           Icons.border_all_rounded,
        //           color: _currentIndex == 2 ? Colors.white : Color(0xFF3C5BFA),
        //         ),
        //         label: 'Project',
        //       ),
        //       NavigationDestination(
        //         icon: CircleAvatar(
        //           foregroundColor: Color(0xFF3C5BFA),
        //           backgroundImage: NetworkImage(
        //             'https://picsum.photos/250?image=9',
        //           ),
        //           radius: 20,
        //         ),
        //         label: '',
        //       )
        //     ],
        //     animationDuration: Duration(milliseconds: 100),
        //     shadowColor: Colors.green,
        //     backgroundColor: const Color(0xFFFFFFFF),
        //     // labelBehavior: NavigationDestinationLabelBehavior.,
        //     surfaceTintColor: Colors.red,
        //     elevation: BorderSide.strokeAlignCenter,
        //     selectedIndex: _currentIndex,
        //     onDestinationSelected: (int index) {
        //       setState(() {
        //         _currentIndex = index;
        //       });
        //     },
        //   ),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _currentIndex,
        // // type: BottomNavigationBarType.fixed,
        // items: const [
        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //       ),
        //       label: 'Home',
        //       backgroundColor: Color(0xFF3C5BFA)),
        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.person_outline,
        //       ),
        //       label: 'Employees',
        //       backgroundColor: Color(0xFF3C5BFA)),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.border_all_rounded),
        //       label: 'Project',
        //       backgroundColor: Color(0xFF3C5BFA)),
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.assessment_outlined),
        //       label: 'Report',
        //       backgroundColor: Color(0xFF3C5BFA)),
        //   BottomNavigationBarItem(
        //       icon: CircleAvatar(
        //         foregroundColor: Color(0xFF3C5BFA),
        //         backgroundImage: NetworkImage(
        //           'https://picsum.photos/250?image=9',
        //         ),
        //         radius: 20,
        //       ),
        //       label: '',
        //       backgroundColor: Color(0xFF3C5BFA))
        // ],
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        //   },
        // )
        );
  }

  Container buildMyNavBar(BuildContext context) {
    var Mwidth = MediaQuery.of(context).size.width;
    var Mheight = MediaQuery.of(context).size.height;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: double.infinity,
              width: Mwidth * 0.25,
              decoration: BoxDecoration(
                color: _currentIndex == 0 ? Color(0xFF3C5BFA) : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    // splashRadius: 0,
                    padding: EdgeInsets.only(bottom: 10, right: 5),
                    constraints: BoxConstraints(),
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    icon: _currentIndex == 0
                        ? const Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 35,
                          )
                        : const Icon(
                            Icons.home_outlined,
                            color: Color(0xFF3C5BFA),
                            size: 35,
                          ),
                  ),
                  CustomText(
                    fontWeight: FontWeight.w500,
                    text: 'Home',
                    textcolor:
                        _currentIndex == 0 ? Colors.white : Color(0xFF3C5BFA),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              width: Mwidth * 0.25,
              decoration: BoxDecoration(
                color: _currentIndex == 1 ? Color(0xFF3C5BFA) : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    // splashRadius: 0,
                    padding: EdgeInsets.only(bottom: 10, right: 5),
                    constraints: BoxConstraints(),
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    icon: _currentIndex == 1
                        ? const Icon(
                            Icons.person_pin_rounded,
                            color: Colors.white,
                            size: 35,
                          )
                        : const Icon(
                            Icons.people_outline_outlined,
                            color: Color(0xFF3C5BFA),
                            size: 35,
                          ),
                  ),
                  CustomText(
                    fontWeight: FontWeight.w500,
                    text: 'Employees',
                    textcolor:
                        _currentIndex == 1 ? Colors.white : Color(0xFF3C5BFA),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              width: Mwidth * 0.25,
              decoration: BoxDecoration(
                color: _currentIndex == 2 ? Color(0xFF3C5BFA) : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    // splashRadius: 0,
                    padding: EdgeInsets.only(bottom: 10, right: 5),
                    constraints: BoxConstraints(),
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    icon: _currentIndex == 2
                        ? const Icon(
                            Icons.border_all_rounded,
                            color: Colors.white,
                            size: 35,
                          )
                        : const Icon(
                            Icons.border_all_rounded,
                            color: Color(0xFF3C5BFA),
                            size: 35,
                          ),
                  ),
                  CustomText(
                    fontWeight: FontWeight.w500,
                    text: 'Projects',
                    textcolor:
                        _currentIndex == 2 ? Colors.white : Color(0xFF3C5BFA),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              width: Mwidth * 0.25,
              decoration: BoxDecoration(
                color: _currentIndex == 3 ? Color(0xFF3C5BFA) : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    // splashRadius: 0,
                    padding: EdgeInsets.only(bottom: 10, right: 5),
                    constraints: BoxConstraints(),
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    icon: _currentIndex == 3
                        ? const Icon(
                            Icons.task,
                            color: Colors.white,
                            size: 35,
                          )
                        : const Icon(
                            Icons.task,
                            color: Color(0xFF3C5BFA),
                            size: 35,
                          ),
                  ),
                  CustomText(
                    fontWeight: FontWeight.w500,
                    text: 'Task',
                    textcolor:
                        _currentIndex == 3 ? Colors.white : Color(0xFF3C5BFA),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              width: Mwidth * 0.25,
              decoration: BoxDecoration(
                  color: _currentIndex == 4 ? Color(0xFF3C5BFA) : Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 4;
                      });
                    },
                    child: CircleAvatar(
                      foregroundColor: Color(0xFF3C5BFA),
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/250?image=9',
                      ),
                      radius: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
