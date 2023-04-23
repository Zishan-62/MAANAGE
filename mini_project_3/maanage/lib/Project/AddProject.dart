import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';
import 'package:maanage/global.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../Models/addMembersToProject.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => AddProjectState();
}

class AddProjectState extends State<AddProject> {
  TextEditingController _date = TextEditingController();
  TextEditingController _dateT = TextEditingController();

// Stackoverflow
  static List<Members> _listofmembers = [
    for (var i = 0; i < Employeedata["users"].length; i++)
      Members(id: i + 1, name: Employeedata["users"][i]["first_name"])

    // Members(id: 27, name: "Dolphin"),
  ];
  final _items = _listofmembers
      .map((member) => MultiSelectItem<Members>(member, member.name!))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List _selectedMembers = [];
  // List<Members> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  // List<Members> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  //get floatingActionButton => null;
  //for attachment
  bool attachvisible = false;

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
        leadingWidth: 5,
        title: Text(
          'ADD PROJECTS',
          style: TextStyle(
            fontWeight: FontWeight.w700,
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'Enter Project name',
              ),
            ),
          ),
          Container(
            // alignment: Alignment.topLeft,
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  borderRadius: BorderRadius.circular(10),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'Enter Discription',
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 15, 10, 10),
            height: height * 0.08,
            width: width * 1,
            color: Color(0xFFF5F5F5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Icon(Icons.attachment_outlined),
                Spacer(
                  flex: 1,
                ),
                Align(
                  child: Text(
                    'Attachments',
                    style: TextStyle(
                      color: Color(0xFF373737),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Spacer(
                  flex: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        attachvisible = !attachvisible;
                      });
                    },
                    icon: Icon(Icons.add),
                    color: Color(0xFF3C5BFA),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Visibility(
              visible: attachvisible,
              child: Container(
                // padding: EdgeInsets.all(8),
                // height: height * 0.3,
                child: Column(children: [
                  AppBar(
                    leading: Icon(Icons.attachment_outlined),
                    title: Text(
                      "Attachments",
                      style: TextStyle(fontSize: 14),
                    ),
                    actions: [
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              attachvisible = !attachvisible;
                            });
                          },
                          icon: Icon(Icons.cancel),
                          // iconSize: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    // centerTitle: true,
                    // leadingWidth: 20,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.08,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Align(
                                    child: Text(
                                      'Upload Images',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    alignment: Alignment.center),
                                onTap: () {},
                              ),
                            ),
                            Container(
                              height: height * 0.08,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Align(
                                    child: Text(
                                      'Google Drive',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    alignment: Alignment.center),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Align(
                            child: Text(
                              "Attach a Link",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
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
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfff4f4f4)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfff4f4f4)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Paste any link here',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Align(
                            child: Row(
                              children: [
                                Text(
                                  "Link Name",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " Optional)",
                                  style: TextStyle(
                                      color: Color(0xffa8a8a8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 25),
                          height: height * 0.08,
                          width: width * 0.97,
                          color: Color(0xFFFFFFFF),
                          child: TextField(
                            style: TextStyle(
                              color: Color(0xFF3C5BFA),
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfff4f4f4)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfff4f4f4)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: height * 0.08,
                            width: width * 0.35,
                            decoration: BoxDecoration(
                              color: Color(0xFF3C5BFA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              child: Align(
                                  child: Text(
                                    'Attach',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  alignment: Alignment.center),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              )),
          SizedBox(height: height * 0.02),
          Container(
            // alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: height * 0.08,
            width: double.infinity,
            color: Color(0xFFF5F5F5),
            child: Row(
              children: const [
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
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add Members to Project',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          Container(
            // alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: height * 0.1,
            width: double.infinity,
            color: Color(0xFFF6F6F6),
            child: MultiSelectChipField(
              showHeader: false,
              items: _items,
              initialValue: [],
              // title: Text("Animals"),
              // headerColor: Colors.blue.withOpacity(0.5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 1.8),
              ),
              selectedChipColor: Color(0xFF3C5BFA),
              selectedTextStyle: TextStyle(color: Colors.white),
              onTap: (values) {
                print(values);
                _selectedMembers = values;
                //_selectedAnimals4 = values;
              },
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),

          Container(
            // alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: height * 0.08,
            width: double.infinity,
            color: Color(0xFFF5F5F5),
            child: Row(
              children: const [
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
                SizedBox(
                  width: 10,
                ),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff4f4f4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff4f4f4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff4f4f4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xfff4f4f4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF3C5BFA),
      //   onPressed: () {},
      //   isExtended: true,
      //   child: Icon(
      //     Icons.add,
      //     color: Color(0xFFFFFFFF),
      //   ),
      // ),
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
                  // Navigator.pushNamed(context, 'project');
                  print(_selectedMembers);
                  print(Employeedata);
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
