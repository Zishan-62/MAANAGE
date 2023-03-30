import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => AddProjectState();
}

class AddProjectState extends State<AddProject> {
  TextEditingController _date = TextEditingController();
  TextEditingController _dateT = TextEditingController();

  //get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFFFFFFFF),
        shape: Border(bottom: BorderSide(color: Color(0xFF3C5BFA), width: 3)),
        elevation: 4,
        title: Text(
          'ADD PROJECTS',
          style: TextStyle(
            color: Color(0xFF373737),
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
            height: height * 0.08,
            width: width * 1,
            color: Color(0xFFF5F5F5),
            child: Align(
              child: Text(
                'Project Name',
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 25),
            height: height * 0.08,
            width: width * 0.97,
            color: Color(0xFFFFFFFF),
            child: TextField(
              style: TextStyle(
                color: Color(0xFF3C5BFA),
              ),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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
            child: Align(
              child: TextButton.icon(
                // <-- TextButton
                onPressed: null,
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
              alignment: Alignment.centerLeft,
            ),
          ),
          Container(
            // alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 25, right: 10),
            // height: height * 0.22,
            width: double.infinity,
            color: Color(0xFFFFFFFF),
            child: TextFormField(
              minLines: 3,
              maxLines: null,
              style: TextStyle(
                color: Color(0xFF3C5BFA),
              ),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'Enter Discription',
              ),
            ),
          ),
          Container(
            // alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: height * 0.08,
            width: double.infinity,
            color: Color(0xFFF5F5F5),
            child: Row(
              children: [
                // Align(
                //   child: TextButton.icon(
                //     // <-- TextButton
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.date_range,
                //       size: 24,
                //       color: Colors.black,
                //     ),
                //     label: Text(
                //       'Date',
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 15,
                //       ),
                //     ),
                //   ),
                //   alignment: Alignment.centerLeft,
                // ),
                Icon(Icons.date_range),
                Text(
                  'Dates',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height * 0.085,
                width: width * 0.45,
                margin: EdgeInsets.fromLTRB(0, 10, 5, 50),
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Color(0xFF3C5BFA),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                  controller: _date,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today_rounded),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      hintText: 'Start Date',
                      hintStyle: TextStyle(fontFamily: "Montserrat"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.blue))),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    if (pickeddate != null) {
                      setState(() {
                        _date.text =
                            DateFormat('dd-MM-yyyy').format(pickeddate);
                      });
                    }
                  },
                ),
              ),
              Container(
                height: height * 0.085,
                width: width * 0.45,
                margin: EdgeInsets.fromLTRB(5, 10, 0, 50),
                child: TextFormField(
                  maxLines: null,
                  readOnly: true,
                  style: TextStyle(
                      color: Color(0xFF3C5BFA),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                  controller: _dateT,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today_rounded),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      hintText: 'End Date',
                      hintStyle: TextStyle(fontFamily: "Montserrat"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.blue))),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    if (pickeddate != null) {
                      setState(() {
                        _dateT.text =
                            DateFormat('dd-MM-yyyy').format(pickeddate);
                      });
                    }
                  },
                ),
              )
            ],
          ),
          // Container(
          //   alignment: Alignment.centerRight,
          //   margin: EdgeInsets.fromLTRB(5, 50, 15, 12),
          //   child: FloatingActionButton(
          //     child: Icon(
          //       Icons.add,
          //       color: Color(0xFFFFFFFF),
          //     ),
          //     onPressed: () {},
          //     backgroundColor: Color(0xFf3C5BFA),
          //   ),
          // ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: <Widget>[
          //         Container(
          //           height: height * 0.10,
          //           width: width * 0.4,
          //           child: InkWell(
          //             child: Container(
          //               margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
          //               decoration: BoxDecoration(
          //                 color: Color(0xFF3C5BFA),
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Align(
          //                   child: Text(
          //                     'SAVE',
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 15
          //                     ),
          //                   ),
          //                   alignment: Alignment.center),
          //             ),
          //             //onTap: (){
          //             //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
          //             //  },
          //             onTap: () {

          //             Navigator.pushNamed(context,'project');
          //             },
          //           ),
          //         ),
          //         Container(
          //            height: height * 0.10,
          //           width: width * 0.4,
          //           child: InkWell(
          //             child: Container(
          //               margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
          //               decoration: BoxDecoration(
          //                 color: Color(0xFFFFFFFF),
          //                 borderRadius: BorderRadius.circular(10),
          //                 border: Border.all(color: Color(0xFF3C5BFA),width: 2),
          //               ),
          //               child: Align(
          //                   child: Text(
          //                     'CANCEL',
          //                     style: TextStyle(
          //                       color: Color(0xFF3C5BFA),
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 15,
          //                     ),
          //                   ),
          //                   alignment: Alignment.center),

          //         ),
          //         //onTap: (){
          //             //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
          //             //  },
          //             onTap: () {
          //               Navigator.pop(context);
          //             },
          //     )

          //      ), ],
          // ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3C5BFA),
        onPressed: () {},
        isExtended: true,
        child: Icon(
          Icons.add,
          color: Color(0xFFFFFFFF),
        ),
      ),
      //start the floating button from here
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: height * 0.10,
              width: width * 0.4,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF3C5BFA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      alignment: Alignment.center),
                ),
                //onTap: (){
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                //  },
                onTap: () {
                  Navigator.pushNamed(context, 'project');
                },
              ),
            ),
            Container(
                height: height * 0.10,
                width: width * 0.4,
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF3C5BFA), width: 2),
                    ),
                    child: Align(
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                            color: Color(0xFF3C5BFA),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
                )),
          ],
        ),
      ],
    );
  }
}
