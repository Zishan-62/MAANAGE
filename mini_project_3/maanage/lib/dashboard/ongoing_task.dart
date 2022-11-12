import 'package:flutter/material.dart';

import '../custom widgets/Custom_text.dart';

class OngoingTask extends StatefulWidget {
  const OngoingTask({super.key});

  @override
  State<OngoingTask> createState() => _OngoingTaskState();
}

class _OngoingTaskState extends State<OngoingTask> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(right: 10, left: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 3rd column ka top wala
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 8),
                    child: CustomText(
                      text: 'ONGOING TASK',
                      textcolor: Color(0xFF3C5BFA),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 8),
                    child: CustomText(
                      text: 'In this month : 5',
                      fontWeight: FontWeight.w400,
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
                            height: MediaQuery.of(context).size.height * 0.22,width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[Padding(
                                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.024,left: MediaQuery.of(context).size.width * 0.03),
                                child: Image.asset('assets/images/office.png'),
                              )
                              ,IconButton(splashColor: Colors.white,
                                onPressed: () {
                                
                              }, icon: Icon(color: Color(0xFF3C5BFA),
                                Icons.more_vert))
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height *0.01,left: 10),
                              child: CustomText(text: 'Website Building',fontWeight: FontWeight.w500,textAlign: TextAlign.start,textcolor: Color(0xFF3C5BFA),),

                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              CustomText(text: 'hello'),


                              Padding(
                                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.013,right: MediaQuery.of(context).size.width *0.035),
                                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CustomText(text: '15 days\n    left',textcolor: Color(0xFF3C5BFA),),
                                    ),
                                  ),
                                ),
                              )
                            ],)
                            ]),
                            
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
