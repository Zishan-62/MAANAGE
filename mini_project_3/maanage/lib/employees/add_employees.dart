import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:validators/validators.dart';
// import 'package:intl/date_symbol_data_http_request.dart';

class AddEmployees extends StatefulWidget {
  const AddEmployees({Key? key}) : super(key: key);

  @override
  State<AddEmployees> createState() => _EditProfileState();
}

class _EditProfileState extends State<AddEmployees> {
  // FOR date of birth
  TextEditingController _date = TextEditingController();
  // FOR date of join
  TextEditingController _dateofjoin = TextEditingController();
  // FOR date of contract
  TextEditingController _dateofcontract = TextEditingController();
  //for gender
  List<String> gender = ['Male', 'Female', 'Other'];
  String selectedgender = 'Male';
  // for company branch
  List<String> company = ['Panvel', 'Andheri', 'Kurla'];
  String selectedcompany = 'Panvel';
// for position in company
  List<String> position = ['Admin', 'User', 'secetary'];
  String selectedposition = 'Admin';
  final formKey = GlobalKey<FormState>();

  File? image;
  final picker = ImagePicker();

  Future getimage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        return;
      }
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        titleSpacing: 0,
        leading: Icon(
          Icons.account_circle_outlined,
          color: Colors.black,
          size: MediaQuery.of(context).size.height * 0.05,
        ),
        title: Text('ADD EMPLOYEES'),

        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: MediaQuery.of(context).size.height * 0.025,
          fontFamily: 'Poppins',
        ),
        backgroundColor: Colors.white,
        shape: Border(
            bottom: BorderSide(
                color: Color(0xff3C5BFA),
                width: MediaQuery.of(context).size.width * 0.005)),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.height * 0.01),
        child: ListView(
          children: [
            imageprofile(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'PERSONAL INFORMATION',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.8),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04),
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    //NAME
                    TextFormField(
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          hintText: 'Enter Name',
                          hintStyle: TextStyle(fontFamily: "Montserrat"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7))),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          //allow upper and lower case alphabets and space
                          return "Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(fontFamily: "Montserrat"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Colors.blue))),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                          //  r'^[0-9]{10}$' pattern plain match number with length 10
                          return "Enter Correct Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email ID',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    TextFormField(
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          hintText: 'Enter Email ID',
                          hintStyle: TextStyle(fontFamily: "Montserrat"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Colors.blue))),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                          return "Enter Correct Email Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Date Of Birth',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      readOnly: true,
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      controller: _date,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today_rounded),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          hintText: 'Enter DOB',
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Gender',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    // drop down for gender
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                        ),
                        value: selectedgender,
                        items: gender
                            .map((gender) => DropdownMenuItem<String>(
                                value: gender, child: Text(gender)))
                            .toList(),
                        onChanged: (gender) => setState(
                          () => selectedgender = gender!,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'ADDRESS',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    TextFormField(
                      style: TextStyle(
                          color: Color(0xFF3C5BFA),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          hintText: 'ADDRESS',
                          hintStyle: TextStyle(fontFamily: "Montserrat"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Colors.blue))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    // CITY
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'City',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF3C5BFA),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    hintText: 'Enter City',
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                        )),
                                    hintStyle:
                                        TextStyle(fontFamily: "Montserrat"),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ],
                          ),
                        ),
                        // pincode
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Pincode',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF3C5BFA),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    hintText: 'Enter Pincode',
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                        )),
                                    hintStyle:
                                        TextStyle(fontFamily: "Montserrat"),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'State',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF3C5BFA),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    hintText: 'Enter State',
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                        )),
                                    hintStyle:
                                        TextStyle(fontFamily: "Montserrat"),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Country',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF3C5BFA),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    hintText: "Enter Country",
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                        )),
                                    hintStyle:
                                        TextStyle(fontFamily: "Montserrat"),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'COMPANY INFORMATION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          letterSpacing: 0.8),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CompanyInfo()
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  return print('object');
                }
              },
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                backgroundColor: Color(0xFF3C5BFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                "ADD EMPLOYEEE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Montserrat"),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                "CANCEL",
                style: TextStyle(
                    color: Color(0xFF3C5BFA),
                    fontSize: 14,
                    fontFamily: "Montserrat"),
              ),
            ),
          )
        ])
      ],
    );
  }

// COMPANY INFO
  Widget CompanyInfo() {
    return Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Select Branch',
            style: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
          ),
          value: selectedcompany,
          items: company
              .map((company) => DropdownMenuItem<String>(
                  value: company, child: Text(company)))
              .toList(),
          onChanged: (company) => setState(
            () => selectedcompany = company!,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Designation',
            style: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          )),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      TextFormField(
        style: TextStyle(
            color: Color(0xFF3C5BFA),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
            // hintText: 'ADDRESS',
            hintStyle: TextStyle(fontFamily: "Montserrat"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.blue))),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Position (Prefrable)',
            style: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
          ),
          value: selectedposition,
          items: position
              .map((position) => DropdownMenuItem<String>(
                  value: position, child: Text(position)))
              .toList(),
          onChanged: (position) => setState(
            () => selectedposition = position!,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Date Of Joining',
            style: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      TextFormField(
        readOnly: true,
        style: TextStyle(
            color: Color(0xFF3C5BFA),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500),
        controller: _dateofjoin,
        decoration: InputDecoration(
            hintText: 'Enter Date Of Joining',
            suffixIcon: Icon(Icons.calendar_today_rounded),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
            hintStyle: TextStyle(fontFamily: "Montserrat"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.blue))),
        onTap: () async {
          DateTime? pickedDOJdate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100));

          if (pickedDOJdate != null) {
            setState(() {
              _dateofjoin.text = DateFormat('dd-MM-yyyy').format(pickedDOJdate);
            });
          }
        },
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            'End of Contract',
            style: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      TextFormField(
        readOnly: true,
        style: TextStyle(
            color: Color(0xFF3C5BFA),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500),
        controller: _dateofcontract,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today_rounded),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
            hintText: 'Enter End Contract Date',
            hintStyle: TextStyle(fontFamily: "Montserrat"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.blue))),
        onTap: () async {
          DateTime? pickedEOCdate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100));

          if (pickedEOCdate != null) {
            setState(() {
              _dateofcontract.text =
                  DateFormat('dd-MM-yyyy').format(pickedEOCdate);
            });
          }
        },
      ),
    ]);
  }

//PICKING IMAGE
  Widget picking() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Text(
          "Choose Profile Photo",
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
                  getimage();
                },
                icon: Icon(Icons.camera, color: Colors.blue),
                label: Text('Camera',
                    style: TextStyle(fontSize: 20, fontFamily: "Montserrat"))),
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

// PROFILE
  Widget imageprofile() {
    return Center(
      child: Stack(children: [
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,
            child: ClipOval(
                child: Container(
              height: 120.0,
              width: 120.0,
              child: image == null
                  ? Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      image!,
                      fit: BoxFit.values[1],
                    ),
            ))),
        Positioned(
            bottom: 0,
            right: 5,
            child: Container(
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
                    Icons.edit,
                    color: Colors.blue,
                  )),
            ))
      ]),
    );
  }
}
