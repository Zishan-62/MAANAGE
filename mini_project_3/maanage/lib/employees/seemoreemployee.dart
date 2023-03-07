import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreEmployee extends StatefulWidget {
  const MoreEmployee({super.key});

  @override
  State<MoreEmployee> createState() => _MoreEmployeeState();
}

List employee = [
  'Umar Siddique',
  'Zishan',
  'Khan Nabil',
  'Shaikh Arsh',
  'Waqqas Malim'
];
List image = [
  'assets/images/Umar.jpeg',
  'assets/images/zishan.jpg',
  'assets/images/Nabil.jpeg',
  'assets/images/Arsh.jpeg',
  'assets/images/waqqas.jpeg'
];

class _MoreEmployeeState extends State<MoreEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 241, 243, 246),
                ),
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Employees',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '05',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.84,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        children: [
                          for (var i = 0; i < 5; i++)
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 40,
                                      child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(image[i])
                                          // Image.asset(
                                          //   image[i],
                                          //   color: Colors.black,
                                          // ),
                                          )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Text(
                                    employee[i],
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 9, 9, 9),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    'Developer',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF777777),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )),
                ]),
              ),
            ],
          )),
    );
  }
}
