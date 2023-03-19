// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/projects.png',
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Projects',
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 2,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.width * 0.03),
              child: Container(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "20/11/122",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Color(0xFFF4f4f4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color(0xffEA4335),
                                ),
                                child: Text(
                                  "URGENT",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/office.png'),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Text(
                                  "Goal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      color: Color(0xFF3C5BFA)),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert),
                                  color: Color(0xFF3C5BFA),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              children: [
                                //niche call kiya hooo
                                hello(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset("assets/images/link.png"),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child:
                                      Image.asset("assets/images/massage.png"),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "viewproject");
                                  },
                                  child: Image.asset("assets/images/done.png"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3C5BFA),
        onPressed: () {
          Navigator.pushNamed(context, 'addproject');
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

//stack hai
  // Widget _buildStack() {
  //   return Stack(
  //     alignment: const Alignment(0.6, 0.6),
  //     children: [
  //       const CircleAvatar(
  //         backgroundImage: AssetImage('assets/images/done.png'),
  //         radius: 20,
  //       ),
  //       Positioned(
  //         left: 30,
  //         child: CircleAvatar(
  //           backgroundImage: AssetImage('assets/images/done.png'),
  //           radius: 20,
  //         ),
  //       ),
  //       Positioned(
  //         right: 15,
  //         child: CircleAvatar(
  //           backgroundImage: AssetImage('assets/images/done.png'),
  //           radius: 20,
  //         ),
  //       ),
  //       Positioned(
  //         right: 20,
  //         child: CircleAvatar(
  //           backgroundImage: AssetImage('assets/images/done.png'),
  //           radius: 20,
  //         ),
  //       ),
  //     ],
  //   );
  // }
//row wala hai
  Widget hello() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            'assets/images/done.png',
          ),
          radius: 20,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/done.png'),
            radius: 20,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/done.png'),
          radius: 20,
        ),
      ],
    );
  }
}
