import 'package:flutter/material.dart';
import 'package:maanage/Login/login.dart';
import 'package:maanage/Project.dart';
import 'package:maanage/Report.dart';
import 'package:maanage/employees/employee.dart';
import './dashboard/dashboard.dart';
import 'Login/CompanyReg.dart';
import 'Profile/edit_profile.dart';
import 'Profile/profile.dart';
import 'Project/projects.dart';
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
      },
      initialRoute: 'companyinfo',
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
    AddMeeting(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[...screen],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
                backgroundColor: Color(0xFF3C5BFA)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Employees',
                backgroundColor: Color(0xFF3C5BFA)),
            BottomNavigationBarItem(
                icon: Icon(Icons.border_all_rounded),
                label: 'Project',
                backgroundColor: Color(0xFF3C5BFA)),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment_outlined),
                label: 'Report',
                backgroundColor: Color(0xFF3C5BFA)),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor: Color(0xFF3C5BFA),
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                  radius: 20,
                ),
                label: '',
                backgroundColor: Color(0xFF3C5BFA))
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
