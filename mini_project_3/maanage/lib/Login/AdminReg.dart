import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class AdminReg extends StatefulWidget {
  const AdminReg({super.key});

  @override
  State<AdminReg> createState() => AdminRegState();
}

class AdminRegState extends State<AdminReg> {
  GlobalKey<FormState> formARkey = GlobalKey<FormState>();

  void validateReg() {
    if (formARkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not validate");
    }
  }

  String dropdowngen = 'Male';
  List ListGen = <String>[
    'Male',
    'Female',
    'Other',
  ];
  File? image;
  final picker = ImagePicker();

  Future getgallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Color(0xFF3C5BFA),
        title: Center(
          child: Text(
            '''Admin\nRegistration''',
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 31,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat"),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formARkey,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07,
                    top: MediaQuery.of(context).size.width * 0.04,
                    bottom: MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getlogo(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.07,
                    ),
                    TextFormField(
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4f4f4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xFFF4F4F4),
                            width: 3,
                          ),
                        ),
                        hintText: 'Admin Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Admin Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                  height: MediaQuery.of(context).size.width * 0.07,
                ),
                    TextFormField(
                      maxLength: 10,
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                         filled: true,
                    fillColor: Color(0xFFF4f4f4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xFFF0F0F0),
                            width: 3,
                          ),
                        ),
                        hintText: 'Admin Phone',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required*';
                        } else if (value.length < 10) {
                          return 'Please Enter 10 Digit No';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                    DropdownButtonFormField<String>(
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                           filled: true,
                    fillColor: Color(0xFFF4f4f4),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0xFFF0F0F0),
                                width: 3,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0xFFF0F0F0),
                                width: 3,
                              ),
                            )),
                        hint: Text('Select Gender'),
                        onChanged: (newValue) {
                          setState(() {
                            dropdowngen = newValue!;
                          });
                        },
                        value: dropdowngen,
                        items: ListGen.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList()),
                        SizedBox(
                  height: MediaQuery.of(context).size.width * 0.07,
                ),
                    TextFormField(
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                         filled: true,
                    fillColor: Color(0xFFF4f4f4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xFFF0F0F0),
                            width: 3,
                          ),
                        ),
                        hintText: 'Admin Address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required*';
                        } else {
                          return null;
                        }
                      },
                    ),SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),

                    Container(
                      // alignment: Alignment.bottomRight,
                      height: height * 0.08,
                      width: width * 0.96,
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                          decoration: BoxDecoration(
                            color: Color(0xFF3C5BFA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.center),
                        ),
                        //onTap: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ),
                        //  },
                        onTap:(){
                        //  validateReg,
                        setState(() {
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MaterialMain()),
  );
                    });}
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Widget picking() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Text(
          "Choose logo from Gallery",
          style: TextStyle(fontSize: 20, fontFamily: "Montserrat"),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () {
                  getgallery();
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.blue,
                ),
                label: Text('Gallery',
                    style: TextStyle(fontSize: 20, fontFamily: "Montserrat")))
          ],
        )
      ]),
    );
  }

  Widget getlogo() {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
            backgroundColor: Colors.black,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Container(
                width: 60,
                child: ClipOval(
                  child: image == null
                      ? Image.asset('assets/images/office.png')
                      : Image.file(
                          image!,
                          fit: BoxFit.values[1],
                        ),
                ),
              ),
            )),
        Text('Upload Logo For Company',
            style: TextStyle(
                fontSize: 13,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500)),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.blue)),
          child: InkWell(
              onTap: () => {
                    showModalBottomSheet(
                        context: context, builder: ((builder) => picking()))
                  },
              child: Icon(
                Icons.upload,
                color: Colors.blue,
              )),
        )
      ]),
    );
  }
}
