import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0,
        leading: Image.asset('assets/images/logo.png'),
        title: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height *0.075),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Icon(
                Icons.location_on,
                color: Color(0xFF3C5BFA),
              ),
              Expanded(child:  Text('Masjid bandar'))
            ],
          ),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
        ),
        backgroundColor: Colors.white,
        shape:  Border(
            bottom: BorderSide(color: Color(0xff3C5BFA), width: MediaQuery.of(context).size.width*0.005)),
        actions: [
          Image.asset('assets/images/coolicon.png'),
          Image.asset('assets/images/layer.png')
        ],
      ),
      body: Column(
        children: [SizedBox(height: MediaQuery.of(context).size.height* 0.03,),
          Center(
            child: Card(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50) ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Color(0xFFF4F4F4)),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Column(children: [
                    Padding(
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.009),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: MediaQuery.of(context).size.height*0.07,
                          child: ClipOval(
                            child: Material(
                                color: Colors.transparent,
                                child: Ink.image(
                                  image: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
                                  fit: BoxFit.cover,
                                )),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'UMAR SIDDIQUE',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C5BFA),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'MAKER  ',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF373737),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: BoxDecoration(
                                color: Color(0xFF3C5BFA),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6)),
                            child: InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.task_sharp,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'Tasks',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          )
                        ]),
                        Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: BoxDecoration(
                                color: Color(0xFF3C5BFA),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6)),
                            child: InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.file_open,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'Projects',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          )
                        ]),
                        Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: BoxDecoration(
                                color: Color(0xFF3C5BFA),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6)),
                            child: InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'Location',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          )
                        ]),
                        Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: BoxDecoration(
                                color: Color(0xFF3C5BFA),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6)),
                            child: InkWell(
                                onTap: () =>
                                    { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  EditProfile()))},
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'EditProfile',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          ),
                        
                        ]),
                      ],
                    ),
                      
                  ]),
                ),
              ),
            ),
          ),
            
        ],
      ),
    );
  }
}
