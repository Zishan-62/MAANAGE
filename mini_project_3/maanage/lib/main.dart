// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maanage/Login/login.dart';
import 'package:maanage/Login/splashScreen.dart';
import 'package:maanage/Project.dart';
import 'package:maanage/Project/viewProject.dart';
import 'package:maanage/Report.dart';
import 'package:maanage/employees/employee.dart';
import 'package:maanage/employees/seemoreleader.dart';
// import 'package:maanage/employees/seeMoreEmployeedart';
import './dashboard/dashboard.dart';
import 'Login/CompanyReg.dart';
import 'Profile/edit_profile.dart';
import 'Profile/profile.dart';
import 'Project/projects.dart';
import 'employees/seeMoreEmployee.dart';
import 'meeting/Createmeeting.dart';
import 'meeting/MeetingDetail.dart';
import 'package:firebase_core/firebase_core.dart';
import './Project/AddProject.dart';

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

  final screen = [
    DashBoard(),
    MyEmployee(),
    ProjectPage(),
    // AddMeeting(),
    Profile()
  ];
  late final ShapeBorder? indicatorShape;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[...screen],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            // indicatorShape: ShapeBorder,
            indicatorColor: Colors.blueAccent,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                color: const Color(0xFF3C5BFA),
                fontSize: 12,
                fontWeight: FontWeight.w500))),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              // selectedIcon: Container(
              //   C
              // ),
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0 ? Colors.white : Color(0xFF3C5BFA),
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                color: _currentIndex == 1 ? Colors.white : Color(0xFF3C5BFA),
              ),
              label: 'Employees',
            ),
            // NavigationDestination(
            //   icon: Icon(
            //     Icons.assessment_outlined,
            //     color: _currentIndex == 2 ? Colors.white : Color(0xFF3C5BFA),
            //   ),
            //   label: 'Report',
            // ),
            NavigationDestination(
              icon: Icon(
                Icons.border_all_rounded,
                color: _currentIndex == 2 ? Colors.white : Color(0xFF3C5BFA),
              ),
              label: 'Project',
            ),
            NavigationDestination(
              icon: CircleAvatar(
                foregroundColor: Color(0xFF3C5BFA),
                backgroundImage: NetworkImage(
                  'https://picsum.photos/250?image=9',
                ),
                radius: 20,
              ),
              label: '',
            )
          ],
          animationDuration: Duration(milliseconds: 100),
          shadowColor: Colors.green,
          backgroundColor: const Color(0xFFFFFFFF),
          // labelBehavior: NavigationDestinationLabelBehavior.,
          surfaceTintColor: Colors.red,
          elevation: BorderSide.strokeAlignCenter,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
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
}
