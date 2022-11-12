import 'package:flutter/material.dart';
import 'package:maanage/Profile/profile.dart';

import '../custom widgets/Custom_text.dart';

class OngoingProject extends StatefulWidget {
  const OngoingProject({super.key});

  @override
  State<OngoingProject> createState() => _OngoingTaskState();
}

class _OngoingTaskState extends State<OngoingProject> {
  List RandomImages = [
    'https://static.generated.photos/vue-static/home/feed/latino-male.png',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://qph.cf2.quoracdn.net/main-qimg-134e3bf89fff27bf56bdbd04e7dbaedf.webp',
    'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.02,
            left: MediaQuery.of(context).size.width * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.02,
              left: MediaQuery.of(context).size.width * 0.02),
          height: MediaQuery.of(context).size.height * 0.39,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 3rd column ka top wala
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.015),
                    child: CustomText(
                      text: 'ONGOING PROJECT',
                      textcolor: Color(0xFF3C5BFA),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.013),
                    child: CustomText(
                      text: 'In this month : 5',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (var i = 0; i < 5; i++)
                        Padding(
                          padding: EdgeInsets.only(
                              left: 7,
                              top: MediaQuery.of(context).size.height * 0.015,
                              right: 7),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.024,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03),
                                        child: Image.asset(
                                            'assets/images/office.png'),
                                      ),
                                      IconButton(
                                          splashColor: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Profile(),
                                                ));
                                          },
                                          icon: Icon(
                                              color: Color(0xFF3C5BFA),
                                              Icons.more_vert))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.013,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.030),
                                    child: CustomText(
                                        text: 'Website Building',
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.start,
                                        textcolor: Color(0xFF3C5BFA),
                                        fontSize: 16),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.,
                                    children: [
                                      for(int i=0; i<RandomImages.length ; i++)
                                      Align(alignment: Alignment.center,
                                        widthFactor: 0.8,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white.withOpacity(0.1),
                                          radius:23,
                                          child: CircleAvatar(
                                            radius: 20,
                                            // backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(RandomImages[i]),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          elevation: 3,
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.008),
                                            child: CustomText(
                                                text: '15 days\n    left',
                                                textcolor: Color(0xFF3C5BFA),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.015,
                    bottom: MediaQuery.of(context).size.height * 0.015),
                child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: Text('All Projects')),
              ),
            ],
          ),
        ));
  }
}

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.02,
            left: MediaQuery.of(context).size.width * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.02,
              left: MediaQuery.of(context).size.width * 0.02),
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: CustomText(
                      text: 'Departments',
                      textcolor: Color(0xFF3C5BFA),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: IconButton(
                        splashRadius: 18,
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )),
                  )
                ],
              ),
              Row(
                children: [],
              )
            ],
          ),
        ));
  }
}
