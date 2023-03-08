import 'dart:async';
import 'dart:developer';
// import 'package:ashu_admin/authentication/login_page.dart';
// import 'package:ashu_admin/dashboard_page.dart';
// import 'package:ashu_admin/global.dart';
// import 'package:ashu_admin/notification/notification_manager.dart';
import 'package:flutter/material.dart';
import 'package:maanage/dashboard/dashboard.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _navigatetohome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? a = pref.getString('fname');
    String? b = pref.getString('lname');
    String? c = pref.getString('phone');
    String? d = pref.getString('email');
    // String? e = pref.getString('rating');
    // String? f = pref.getString('gender');
    // String? g = pref.getString('dob');
    // String? h = pref.getString('age');
    // String? i = pref.getString('address');
    // String? j = pref.getString('mobile');
    // String? k = pref.getString('qualification');
    // String? l = pref.getString('speciality');
    // String? m = pref.getString('joinDate');
    // String? n = pref.getString('u_id');
    // String? o = pref.getString('roleName');
    // String? p = pref.getString('roleId');
    // String? q = pref.getString('img');

    // setState(() {
    //   print(a.toString());
    //   print(n.toString());
    //   name = a.toString();
    //   org_id = c.toString();
    //   u_id = n.toString();
    //   admin = b.toString();
    //   email = d.toString();
    //   rating = e.toString();
    //   gender = f.toString();
    //   dob = g.toString();
    //   age = h.toString();
    //   address = i.toString();
    //   mobile = j.toString();
    //   qualification = k.toString();
    //   speciality = l.toString();
    //   join_date = m.toString();
    //   roleId = p.toString();
    //   roleName = o.toString();
    //   img = q.toString();
    //   print(u_id);
    // });
    if (a != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), _navigatetohome);
    // requestNotificationPermission();
  }

  // Future<void> requestNotificationPermission() async {
  //   // setState(() => firebaseTips = 'requesting permission...');
  //   await NotificationManager.shared.requestNotificationPermission();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/images/maanage.png",
        height: 240,
      ),
    ));
  }
}
