import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'AdminReg.dart';
// import 'package:firstapp/pages/AdminReg.dart';
// import 'package:form_field_validator/form_field_validator.dart';

class CompanyReg extends StatefulWidget {
  const CompanyReg({super.key});

  @override
  State<CompanyReg> createState() => CompanyRegState();
}

class CompanyRegState extends State<CompanyReg> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not validate");
    }
  }

  String dropdownVle = 'Public Company';
  String dropdownV = '10 Employes';
  List listItem = <String>[
    'Private Company',
    'Public Company',
    'C Coprporation',
    'S Corporation',
    'Small business',
    'Multinational Corporation',
  ];

  List ListEmp = <String>[
    '10 Employes',
    '15 Employes',
    '20 Emoloyes',
    '25 Employes',
    '30 Employes'
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
            '''COMPANY\nREGISTRATION''',
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 31,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
                top: MediaQuery.of(context).size.width * 0.01,
                bottom: MediaQuery.of(context).size.width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                
                getlogo(),
                
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
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
                        color: Color(0xFFF0F0F0),
                        width: 3,
                      ),
                    ),
                    hintText: 'Company Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter company name';
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
                    hint: Text('Company type'),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownVle = newValue!;
                      });
                    },
                    value: dropdownVle,
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
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
                    hint: Text('No of Employes'),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownV = newValue!;
                      });
                    },
                    value: dropdownV,
                    items: ListEmp.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList()),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
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
                        color: Color(0xFFF0F0F0),
                        width: 3,
                      ),
                    ),
                    hintText: 'Company Email',
                  ),
                  // validator: MultiValidator([
                  //   RequiredValidator(errorText: 'Required*'),
                  //   EmailValidator(errorText: 'Not a Valid Email'),
                  // ])
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
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
                        color: Color(0xFFF0F0F0),
                        width: 3,
                      ),
                    ),
                    hintText: 'Company Phone',
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
                  height: MediaQuery.of(context).size.width * 0.1,
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
                    hintText: 'Company Address',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Company Address';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
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
                            'NEXT',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.center),
                    ),
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminReg() ));

                    },
                    // onTap: validate,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                    style: TextStyle(fontSize: 13, fontFamily: "Montserrat",fontWeight: FontWeight.w500)),
            
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
    );}
}
