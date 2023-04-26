import 'package:flutter/material.dart';

import '../custom widgets/Custom_text.dart';

class TeamLeaders extends StatelessWidget {
  const TeamLeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(right: 10, left: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
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
                      text: 'Team Members',
                      textcolor: Color(0xFF3C5BFA),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.04, top: MediaQuery.of(context).size.height*0.004),
                    child: CustomText(
                      text: '10',
                      fontWeight: FontWeight.w600,
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
                      for (var i = 0; i < 10; i++)
                        Padding(
                          padding: EdgeInsets.only(left: 7, top: 7, right: 7),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://picsum.photos/250?image=9'),
                            radius: MediaQuery.of(context).size.height*0.04,
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
