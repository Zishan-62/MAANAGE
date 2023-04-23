import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';

class EditMeetDetail extends StatefulWidget {
  const EditMeetDetail({super.key});

  @override
  State<EditMeetDetail> createState() => _EditMeetDetailState();
}

class _EditMeetDetailState extends State<EditMeetDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0, bottom: 5),
                  child: CustomText(
                    text: '  Wed, 03 AUG',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    textcolor: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      CustomText(
                          text: '12:00 AM ',
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          textcolor: Colors.black,
                          fontSize: 12),
                      CustomText(
                          text: "(Start Now)",
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          textcolor: Color(0xff4CB151),
                          fontSize: 12),
                    ],
                  ),
                ),
              ],
            )
          ],
          toolbarHeight: 60,
          backgroundColor: Color(0xFFFFFFFF),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Color(0xFF373737),
            ),
          ),
          // leadingWidth: 10,
          shape: Border(bottom: BorderSide(color: Color(0xFF3C5BFA), width: 3)),
          elevation: 4,
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          title: Text(
            "Laundary Go",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          )),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
            height: height * 0.08,
            width: width * 1,
            color: Color(0xFFF5F5F5),
            child: Text(
              'Project Name',
              style: TextStyle(
                color: Color(0xFF373737),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            height: height * 0.08,
            width: width * 0.97,
            child: TextField(
              readOnly: true,
              style: TextStyle(
                color: Color(0xFF3C5BFA),
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0xfff4f4f4),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter Project name',
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: height * 0.08,
            width: width * 1,
            color: Color(0xFFF5F5F5),
            child: TextButton.icon(
              // <-- TextButton
              onPressed: () {},
              icon: Icon(
                Icons.textsms,
                size: 24,
                color: Colors.black,
              ),
              label: Text(
                'Title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            height: height * 0.08,
            width: width * 0.97,
            // color: Color(0xFFF4F4F4),
            child: TextField(
              readOnly: true,
              style: TextStyle(
                color: Color(0xFF3C5BFA),
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0xfff4f4f4),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter Title',
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: height * 0.08,
            width: width * 1,
            color: Color(0xFFF5F5F5),
            child: TextButton.icon(
              // <-- TextButton
              onPressed: () {},
              icon: Icon(
                Icons.notes,
                size: 24,
                color: Colors.black,
              ),
              label: Text(
                'Discription',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
            height: height * 0.33,
            width: width * 0.97,
            // color: Color(0xFff4f4f4),
            child: TextFormField(
              readOnly: true,
              style: TextStyle(
                color: Color(0xFF3C5BFA),
              ),
              minLines: 13,
              maxLines: 15,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0xfff4f4f4),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter Discription',
              ),
            ),
          ),
          Container(
            color: Color(0xFFF5F5F5),
            height: height * 0.08,
            width: width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  //  height: height * 0.08,
                  //  width: width * 0.1,
                  color: Color(0xFFF5F5F5),
                  child: TextButton.icon(
                    // <-- TextButton
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Members',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(200, 0, 20, 0),
                  alignment: Alignment.centerRight,
                  // color: Colors.deepPurple,
                  height: 40,
                  width: 40,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF3C5BFA),
                          size: 30,
                        ),
                      ),
                    ),
                    //onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                    //  },
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: <Widget>[
          //         for (var i = 0; i < 10; i++)
          //           Padding(
          //             padding: const EdgeInsets.only(right: 5, left: 5),
          //             child: CircleAvatar(
          //               backgroundImage: AssetImage("assets/images/Umar.jpeg"),
          //               radius: MediaQuery.of(context).size.height * 0.04,
          //             ),
          //           )
          //       ],
          //     ),
          //   ),
          // ),
          Container(
              height: height * 0.09,
              margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Umar.jpeg"),
                        radius: MediaQuery.of(context).size.height * 0.04,
                      ),
                    );
                  })),
        ])
      ]),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: height * 0.085,
              width: width * 0.4,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                  decoration: BoxDecoration(
                    color: Color(0xFF3C5BFA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                      child: Text(
                        'Start Meeting',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      alignment: Alignment.center),
                ),
                //onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                //  },
                onTap: () {},
              ),
            ),
            Container(
              height: height * 0.085,
              width: width * 0.4,
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF4545),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      alignment: Alignment.center),
                ),
                //onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                //  },
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
