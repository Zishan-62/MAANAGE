import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class SeeMoreLeader extends StatefulWidget {
  const SeeMoreLeader({super.key});

  @override
  State<SeeMoreLeader> createState() => _SeeMoreLeaderState();
}

class _SeeMoreLeaderState extends State<SeeMoreLeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                        'Team Leader',
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
                                      child: ClipOval(
                                        child: Material(
                                            color: Colors.transparent,
                                            child: Ink.image(
                                              image: AssetImage(image[i]),
                                              // NetworkImage(
                                              //     'https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
                                              fit: BoxFit.cover,
                                            )),
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
