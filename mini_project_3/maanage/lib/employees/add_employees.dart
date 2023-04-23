import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:maanage/Models/roles.dart';
import 'package:maanage/custom%20widgets/Custom_text.dart';
import 'package:maanage/global.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:convert';
// import 'package:path/path.dart';

// import 'dart:convert';
// import 'package:path/path.dart';

// import 'dart:convert';
// import 'package:path/path.dart';
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
  TextEditingController name = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController email = TextEditingController();
  // FOR date of join
  TextEditingController _dateofjoin = TextEditingController();
  // FOR date of contract
  TextEditingController _dateofcontract = TextEditingController();
  // TextEditingController role = TextEditingController();

  //for gender
  bool isSelected = false;
  bool isSelectedEmp = false;
  List<String> gender = ['Male', 'Female', 'Other'];
  String selectedgender = 'Male';
  // for company branch
  List<String> company = ['Panvel', 'Andheri', 'Kurla'];
  String selectedcompany = 'Panvel';
// for position in company
  List<String> position = ['Admin', 'User', 'secetary'];
  List<String> pos = [];
  var data2;
  String selectedposition = '';
  final formKey = GlobalKey<FormState>();
  List<roles> rroles = [];
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
  void initState() {
    super.initState();
    postdetails();
  }

  postdetails() async {
    var headers = {
      'X-API-KEY': 'taibah123456',
      'Cookie': 'ci_session=bcb62934de50963a2614af39dc5adc867fc1082c'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://softdigit.in/softdigits/permission/Role_controller/role/${appr_id}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    var convert = json.decode(data);
    if (response.statusCode == 200) {
      data2 = convert['data'];
      for (var i = 0; i < data2.length; i++) {
        roles(data2[i]['id'], data2[i]['roles']);
        rroles.add(roles(data2[i]['id'], data2[i]['roles']));
      }
      setState(() {
        isSelected = true;
      });
      // print(object)
      // for(var i in data2)
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  register(File imageFile, context) async {
    setState(() {
      isSelectedEmp = true;
    });
    print(imageFile.path);
//     var stream = http.ByteStream((imageFile.openRead()));
//     stream.cast();
//     var length = await imageFile.length();
//     print(length);
//     var headers = {
//       'x-api-key': 'taibah123456',
//       'Cookie': 'ci_session=826e73b4b9b81d73fafe20b2b865c27aeff40a5b'
//     };
//     var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//             'https://softdigit.in/softdigits/api/Authentication/registration'));
//     request.fields.addAll({
//       'email': email.text,
//       // 'password': 'umar123',
//       'first_name': name.text,
//       // 'last_name': 'Siddiqu',
//       'phone': phoneno.text,
//       'gender': selectedgender,
//       'role': selectedposition,
//       'appr_id': appr_id,
//       'address': 'Andheri'
//     });
// // request.files.add(await http.MultipartFile.fromPath('img', '/C:/Users/91770/Pictures/Screenshots/Screenshot (2).png'));
// // request.headers.addAll(headers);
//     var multipartFile = await http.MultipartFile('img', stream, length,
//         filename: basename(imageFile.path));
//     // print(stream.bytesToString());
//     request.files.add(multipartFile);

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       print('successfull');
//       // print(await response.stream.bytesToString());
//     } else {
//       // print(response.reasonPhrase);
//       print('unsuccessfull');
//     }
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse(
        "https://softdigit.in/softdigits/api/Authentication/registration");

    var headers = {
      'x-api-key': 'taibah123456',
      'Cookie': 'ci_session=f9671b997826d6b0106c8e4d15d6ef9b240865e9'
    };
    var request = http.MultipartRequest("POST", uri);
    request.fields.addAll({
      'email': email.text,
      'first_name': name.text,
      'phone': phoneno.text,
      'gender': selectedgender,
      'role': selectedposition,
      'appr_id': appr_id,
      'admin_id': appr_id,
      'address': 'Andheri'
    });
    request.files.add(http.MultipartFile('img', stream, length,
        filename: basename(imageFile.path)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        isSelectedEmp = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(
        text: 'Employee Successfully added',
        textcolor: Colors.white,
      )));
      Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
      setState(() {
        isSelectedEmp = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var Mheight = MediaQuery.of(context).size.height;
    var Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                print(data2);

                // print(data2.length);
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
        // centerTitle: true,
        titleSpacing: 0,
        leading: Icon(
          Icons.account_circle_outlined,
          color: Colors.black,
          size: Mheight * 0.05,
        ),
        title: Text('ADD EMPLOYEES'),

        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: Mheight * 0.025,
          fontFamily: 'Poppins',
        ),
        backgroundColor: Colors.white,
        shape: Border(
            bottom:
                BorderSide(color: Color(0xff3C5BFA), width: Mwidth * 0.005)),
      ),
      body: isSelected == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding:
                  EdgeInsets.only(top: Mheight * 0.05, left: Mheight * 0.01),
              child: ListView(
                children: [
                  // imageprofile(),
                  Center(
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
                                border:
                                    Border.all(width: 2, color: Colors.blue)),
                            child: InkWell(
                                onTap: () => {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) => Container(
                                                height: 100.0,
                                                width: Mwidth,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child: Column(children: [
                                                  Text(
                                                    "Choose Profile Photo",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily:
                                                            "Montserrat"),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextButton.icon(
                                                          onPressed: () {
                                                            getimage();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Icon(
                                                              Icons.camera,
                                                              color:
                                                                  Colors.blue),
                                                          label: Text('Camera',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      "Montserrat"))),
                                                      TextButton.icon(
                                                          onPressed: () {
                                                            getgallery();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Icon(
                                                            Icons.image,
                                                            color: Colors.blue,
                                                          ),
                                                          label: Text('Gallery',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      "Montserrat")))
                                                    ],
                                                  )
                                                ]),
                                              )))
                                    },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                )),
                          ))
                    ]),
                  ),
                  SizedBox(
                    height: Mheight * 0.03,
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
                    height: Mheight * 0.01,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          right: Mheight * 0.04, left: Mheight * 0.04),
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
                            height: Mheight * 0.02,
                          ),
                          //NAME
                          TextFormField(
                            controller: name,
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
                            height: Mheight * 0.02,
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
                            height: Mheight * 0.01,
                          ),
                          TextFormField(
                            controller: phoneno,
                            keyboardType: TextInputType.phone,
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
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
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
                            height: Mheight * 0.02,
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
                            height: Mheight * 0.01,
                          ),

                          TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
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
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
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
                            height: Mheight * 0.02,
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
                            height: Mheight * 0.01,
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
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1980),
                                  lastDate: DateTime.now());

                              if (pickeddate != null) {
                                setState(() {
                                  _date.text = DateFormat('dd-MM-yyyy')
                                      .format(pickeddate);
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: Mheight * 0.02,
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
                            height: Mheight * 0.01,
                          ),
                          // drop down for gender
                          SizedBox(
                            width: Mwidth * 0.8,
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
                            height: Mheight * 0.02,
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
                            height: Mheight * 0.01,
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
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                          ),
                          SizedBox(
                            height: Mheight * 0.02,
                          ),
                          // CITY
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Mwidth * 0.37,
                                height: Mheight * 0.2,
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
                                      height: Mheight * 0.01,
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
                                          hintStyle: TextStyle(
                                              fontFamily: "Montserrat"),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ],
                                ),
                              ),
                              // pincode
                              SizedBox(
                                width: Mwidth * 0.37,
                                height: Mheight * 0.2,
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
                                      height: Mheight * 0.01,
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
                                          hintStyle: TextStyle(
                                              fontFamily: "Montserrat"),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
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
                                width: Mwidth * 0.37,
                                height: Mheight * 0.2,
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
                                      height: Mheight * 0.01,
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
                                          hintStyle: TextStyle(
                                              fontFamily: "Montserrat"),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Mwidth * 0.37,
                                height: Mheight * 0.2,
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
                                      height: Mheight * 0.01,
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
                                          hintStyle: TextStyle(
                                              fontFamily: "Montserrat"),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.blue))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Mheight * 0.01,
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
                            height: Mheight * 0.01,
                          ),
                          // CompanyInfo()
                          Column(children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Select Branch',
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              height: Mheight * 0.01,
                            ),
                            SizedBox(
                              height: Mheight * 0.09,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
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
                              height: Mheight * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Designation',
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(height: Mheight * 0.01),
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
                                  // hintText: 'ADDRESS',
                                  hintStyle:
                                      TextStyle(fontFamily: "Montserrat"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                            ),
                            SizedBox(
                              height: Mheight * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Position (Prefrable)',
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              height: Mheight * 0.01,
                            ),
                            SizedBox(
                              height: Mheight * 0.09,
                              child: DropdownButtonFormField<roles>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                ),
                                value: rroles[0],
                                // items: data2.map((map) {
                                //   return DropdownMenuItem(
                                //     child: Text(map['roles']),
                                //     value: map['id'],
                                //   );
                                // }).toList(),

                                // items:data2.map((map) {[
                                //   for (var i = 0; i < data2.length; i++)
                                //     DropdownMenuItem(
                                //         child: CustomText(
                                //       text: data2[i]['roles'],
                                //     ))
                                // ],
                                items: rroles
                                    .map((position) => DropdownMenuItem<roles>(
                                        value: position,
                                        child: Text(position.name)))
                                    .toList(),
                                onChanged: (position) => setState(
                                  () => selectedposition = position!.id,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Mheight * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Date Of Joining',
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              height: Mheight * 0.01,
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
                                  suffixIcon:
                                      Icon(Icons.calendar_today_rounded),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  hintStyle:
                                      TextStyle(fontFamily: "Montserrat"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                              onTap: () async {
                                DateTime? pickedDOJdate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));

                                if (pickedDOJdate != null) {
                                  setState(() {
                                    _dateofjoin.text = DateFormat('dd-MM-yyyy')
                                        .format(pickedDOJdate);
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: Mheight * 0.02,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'End of Contract',
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              height: Mheight * 0.01,
                            ),
                            TextFormField(
                              readOnly: true,
                              style: TextStyle(
                                  color: Color(0xFF3C5BFA),
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                              controller: _dateofcontract,
                              decoration: InputDecoration(
                                  suffixIcon:
                                      Icon(Icons.calendar_today_rounded),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  hintText: 'Enter End Contract Date',
                                  hintStyle:
                                      TextStyle(fontFamily: "Montserrat"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                              onTap: () async {
                                DateTime? pickedEOCdate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));

                                if (pickedEOCdate != null) {
                                  setState(() {
                                    _dateofcontract.text =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedEOCdate);
                                  });
                                }
                              },
                            ),
                          ])
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
            height: Mheight * 0.08,
            width: Mwidth * 0.45,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  print(selectedgender);
                });
                // if (formKey.currentState!.validate()) {
                //   return print('object');
                // }
                print(image);
                register(image!, context);
              },
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                backgroundColor: Color(0xFF3C5BFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: isSelectedEmp == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      "ADD EMPLOYEEE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Montserrat"),
                    ),
            ),
          ),
          SizedBox(
            width: Mwidth * 0.03,
          ),
          SizedBox(
            height: Mheight * 0.08,
            width: Mwidth * 0.45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
  // Widget CompanyInfo() {
  // var Mheight=MediaQuery.of(context).size.height;

  // return Column(children: [
  //   Align(
  //       alignment: Alignment.topLeft,
  //       child: Text(
  //         'Select Branch',
  //         style: TextStyle(
  //             fontFamily: "Montserrat", fontWeight: FontWeight.bold),
  //         textAlign: TextAlign.left,
  //       )),
  //   SizedBox(
  //     height: Mheight * 0.01,
  //   ),
  //   SizedBox(
  //     height: Mheight * 0.09,
  //     child: DropdownButtonFormField<String>(
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(7),
  //             borderSide: BorderSide(color: Colors.blue)),
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(4)),
  //             borderSide: BorderSide(
  //               width: 1,
  //             )),
  //       ),
  //       value: selectedcompany,
  //       items: company
  //           .map((company) => DropdownMenuItem<String>(
  //               value: company, child: Text(company)))
  //           .toList(),
  //       onChanged: (company) => setState(
  //         () => selectedcompany = company!,
  //       ),
  //     ),
  //   ),
  //   SizedBox(
  //     height: Mheight * 0.02,
  //   ),
  //   Align(
  //       alignment: Alignment.topLeft,
  //       child: Text(
  //         'Designation',
  //         style: TextStyle(
  //             fontFamily: "Montserrat", fontWeight: FontWeight.bold),
  //         textAlign: TextAlign.left,
  //       )),
  //   SizedBox(height: Mheight * 0.01),
  //   TextFormField(
  //     style: TextStyle(
  //         color: Color(0xFF3C5BFA),
  //         fontFamily: "Montserrat",
  //         fontWeight: FontWeight.w500),
  //     decoration: InputDecoration(
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(4)),
  //             borderSide: BorderSide(
  //               width: 1,
  //             )),
  //         // hintText: 'ADDRESS',
  //         hintStyle: TextStyle(fontFamily: "Montserrat"),
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(7),
  //             borderSide: BorderSide(color: Colors.blue))),
  //   ),
  //   SizedBox(
  //     height: Mheight * 0.02,
  //   ),
  //   Align(
  //       alignment: Alignment.topLeft,
  //       child: Text(
  //         'Position (Prefrable)',
  //         style: TextStyle(
  //             fontFamily: "Montserrat", fontWeight: FontWeight.bold),
  //         textAlign: TextAlign.left,
  //       )),
  //   SizedBox(
  //     height: Mheight * 0.01,
  //   ),
  //   SizedBox(
  //     height: Mheight * 0.09,
  //     child: DropdownButtonFormField<String>(
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(7),
  //             borderSide: BorderSide(color: Colors.blue)),
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(4)),
  //             borderSide: BorderSide(
  //               width: 1,
  //             )),
  //       ),
  //       value: selectedposition,
  //       items: position
  //           .map((position) => DropdownMenuItem<String>(
  //               value: position, child: Text(position)))
  //           .toList(),
  //       onChanged: (position) => setState(
  //         () => selectedposition = position!,
  //       ),
  //     ),
  //   ),
  //   SizedBox(
  //     height: Mheight * 0.02,
  //   ),
  //   Align(
  //       alignment: Alignment.topLeft,
  //       child: Text(
  //         'Date Of Joining',
  //         style: TextStyle(
  //             fontFamily: "Montserrat", fontWeight: FontWeight.bold),
  //         textAlign: TextAlign.left,
  //       )),
  //   SizedBox(
  //     height: Mheight * 0.01,
  //   ),
  //   TextFormField(
  //     readOnly: true,
  //     style: TextStyle(
  //         color: Color(0xFF3C5BFA),
  //         fontFamily: "Montserrat",
  //         fontWeight: FontWeight.w500),
  //     controller: _dateofjoin,
  //     decoration: InputDecoration(
  //         hintText: 'Enter Date Of Joining',
  //         suffixIcon: Icon(Icons.calendar_today_rounded),
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(4)),
  //             borderSide: BorderSide(
  //               width: 1,
  //             )),
  //         hintStyle: TextStyle(fontFamily: "Montserrat"),
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(7),
  //             borderSide: BorderSide(color: Colors.blue))),
  //     onTap: () async {
  //       DateTime? pickedDOJdate = await showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(2000),
  //           lastDate: DateTime(2100));

  //       if (pickedDOJdate != null) {
  //         setState(() {
  //           _dateofjoin.text = DateFormat('dd-MM-yyyy').format(pickedDOJdate);
  //         });
  //       }
  //     },
  //   ),
  //   SizedBox(
  //     height: Mheight * 0.02,
  //   ),
  //   Align(
  //       alignment: Alignment.topLeft,
  //       child: Text(
  //         'End of Contract',
  //         style: TextStyle(
  //             fontFamily: "Montserrat", fontWeight: FontWeight.bold),
  //         textAlign: TextAlign.left,
  //       )),
  //   SizedBox(
  //     height: Mheight * 0.01,
  //   ),
  //   TextFormField(
  //     readOnly: true,
  //     style: TextStyle(
  //         color: Color(0xFF3C5BFA),
  //         fontFamily: "Montserrat",
  //         fontWeight: FontWeight.w500),
  //     controller: _dateofcontract,
  //     decoration: InputDecoration(
  //         suffixIcon: Icon(Icons.calendar_today_rounded),
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(4)),
  //             borderSide: BorderSide(
  //               width: 1,
  //             )),
  //         hintText: 'Enter End Contract Date',
  //         hintStyle: TextStyle(fontFamily: "Montserrat"),
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(7),
  //             borderSide: BorderSide(color: Colors.blue))),
  //     onTap: () async {
  //       DateTime? pickedEOCdate = await showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(2000),
  //           lastDate: DateTime(2100));

  //       if (pickedEOCdate != null) {
  //         setState(() {
  //           _dateofcontract.text =
  //               DateFormat('dd-MM-yyyy').format(pickedEOCdate);
  //         });
  //       }
  //     },
  //   ),
  // ]);
}

//PICKING IMAGE
  // Widget picking() {
  //   var Mwidth=MediaQuery.of(context).size.width;
  //   return Container(
  //     height: 100.0,
  //     width: Mwidth,
  //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     child: Column(children: [
  //       Text(
  //         "Choose Profile Photo",
  //         style: TextStyle(fontSize: 20, fontFamily: "Montserrat"),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           TextButton.icon(
  //               onPressed: () {
  //                 getimage();
  //               },
  //               icon: Icon(Icons.camera, color: Colors.blue),
  //               label: Text('Camera',
  //                   style: TextStyle(fontSize: 20, fontFamily: "Montserrat"))),
  //           TextButton.icon(
  //               onPressed: () {
  //                 getgallery();
  //               },
  //               icon: Icon(
  //                 Icons.image,
  //                 color: Colors.blue,
  //               ),
  //               label: Text('Gallery',
  //                   style: TextStyle(fontSize: 20, fontFamily: "Montserrat")))
  //         ],
  //       )
  //     ]),
  //   );
  // }

// PROFILE
  // Widget imageprofile() {
  //   return Center(
  //     child: Stack(children: [
  //       CircleAvatar(
  //           backgroundColor: Colors.white,
  //           radius: 60,
  //           child: ClipOval(
  //               child: Container(
  //             height: 120.0,
  //             width: 120.0,
  //             child: image == null
  //                 ? Image.asset(
  //                     'assets/images/profile.png',
  //                     fit: BoxFit.cover,
  //                   )
  //                 : Image.file(
  //                     image!,
  //                     fit: BoxFit.values[1],
  //                   ),
  //           ))),
  //       Positioned(
  //           bottom: 0,
  //           right: 5,
  //           child: Container(
  //             height: 40,
  //             width: 40,
  //             decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 shape: BoxShape.circle,
  //                 border: Border.all(width: 2, color: Colors.blue)),
  //             child: InkWell(
  //                 onTap: () => {
  //                       showModalBottomSheet(
  //                           context: context, builder: ((builder) => Container(
  //     height: 100.0,
  //     width: Mwidth,
  //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     child: Column(children: [
  //       Text(
  //         "Choose Profile Photo",
  //         style: TextStyle(fontSize: 20, fontFamily: "Montserrat"),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           TextButton.icon(
  //               onPressed: () {
  //                 getimage();
  //               },
  //               icon: Icon(Icons.camera, color: Colors.blue),
  //               label: Text('Camera',
  //                   style: TextStyle(fontSize: 20, fontFamily: "Montserrat"))),
  //           TextButton.icon(
  //               onPressed: () {
  //                 getgallery();
  //               },
  //               icon: Icon(
  //                 Icons.image,
  //                 color: Colors.blue,
  //               ),
  //               label: Text('Gallery',
  //                   style: TextStyle(fontSize: 20, fontFamily: "Montserrat")))
  //         ],
  //       )
  //     ]),
  //   )))
  //                     },
  //                 child: Icon(
  //                   Icons.edit,
  //                   color: Colors.blue,
  //                 )),
  //           ))
  //     ]),
  //   );
  // }

