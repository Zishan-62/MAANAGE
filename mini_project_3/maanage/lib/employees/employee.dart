import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maanage/employees/add_employees.dart';

class MyEmployee extends StatefulWidget {
  const MyEmployee({super.key});

  @override
  State<MyEmployee> createState() => _MyEmployeeState();
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

class _MyEmployeeState extends State<MyEmployee> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height * 0.34,
              // height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 241, 243, 246),
              ),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Team Leader',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                        color: Color(0xff3C5BFA),
                        onPressed: () {
                          Navigator.pushNamed(context, "seemoreleader");
                        },
                        icon: Icon(Icons.more))
                  ],
                ),
                Container(
                  height: height * 0.25,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: [
                      for (var i = 0; i < 5; i++)
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
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
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Employeess(context)
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: Null,
        backgroundColor: Color(0xFF3C5BFA),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEmployees()),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

//for employes
Widget Employeess(context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Container(
    child: Column(children: [
      // SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.02,
      // ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Employees',
            style: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          IconButton(
              color: Color(0xff3C5BFA),
              onPressed: () {
                Navigator.pushNamed(context, "moreemployee");
              },
              icon: Icon(Icons.more))
        ],
      ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.01,
      // ),
      Container(
        height: height * 0.45,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: [
            for (var j = 0; j < 4; j++)
              Container(
                width: 200,
                height: 400,
                child: Card(
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
                                  image: AssetImage(image[j]),
                                  fit: BoxFit.cover,
                                )),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        employee[j],
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 9, 9, 9),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
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
              ),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //           backgroundColor: Colors.white,
            //           radius: 40,
            //           child: ClipOval(
            //             child: Material(
            //                 color: Colors.transparent,
            //                 child: Ink.image(
            //                   image: NetworkImage(
            //                       'https://cdn.pixabay.com/photo/2015/11/16/16/28/bird-1045954_960_720.jpg'),
            //                   fit: BoxFit.cover,
            //                 )),
            //           )),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.02,
            //       ),
            //       Text(
            //         'SORATHIYA ZISHAN',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //         ),
            //       ),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.01,
            //       ),
            //       Text(
            //         'MAKER',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 10,
            //           fontWeight: FontWeight.w500,
            //           color: Color(0xFF777777),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //           backgroundColor: Colors.white,
            //           radius: 40,
            //           child: ClipOval(
            //             child: Material(
            //                 color: Colors.transparent,
            //                 child: Ink.image(
            //                   image: NetworkImage(
            //                       'https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
            //                   fit: BoxFit.cover,
            //                 )),
            //           )),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.02,
            //       ),
            //       Text(
            //         'UMAR SIDDIQUE',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //           color: Color.fromARGB(255, 9, 9, 9),
            //         ),
            //       ),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.01,
            //       ),
            //       Text(
            //         'MAKER',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 10,
            //           fontWeight: FontWeight.w500,
            //           color: Color(0xFF777777),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //           backgroundColor: Colors.white,
            //           radius: 40,
            //           child: ClipOval(
            //             child: Material(
            //                 color: Colors.transparent,
            //                 child: Ink.image(
            //                   image: NetworkImage(
            //                       'https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
            //                   fit: BoxFit.cover,
            //                 )),
            //           )),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.02,
            //       ),
            //       Text(
            //         'UMAR SIDDIQUE',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //           color: Color.fromARGB(255, 9, 9, 9),
            //         ),
            //       ),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.01,
            //       ),
            //       Text(
            //         'MAKER',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 10,
            //           fontWeight: FontWeight.w500,
            //           color: Color(0xFF777777),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //           backgroundColor: Colors.white,
            //           radius: 40,
            //           child: ClipOval(
            //             child: Material(
            //                 color: Colors.transparent,
            //                 child: Ink.image(
            //                   image: NetworkImage(
            //                       'https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
            //                   fit: BoxFit.cover,
            //                 )),
            //           )),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.02,
            //       ),
            //       Text(
            //         'UMAR SIDDIQUE',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //           color: Color.fromARGB(255, 9, 9, 9),
            //         ),
            //       ),
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.01,
            //       ),
            //       Text(
            //         'MAKER',
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 10,
            //           fontWeight: FontWeight.w500,
            //           color: Color(0xFF777777),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ]),
  );
}
