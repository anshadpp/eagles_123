

// import 'package:early_warning/Changepassword.dart';
// import 'package:early_warning/complaint.dart';
// import 'package:early_warning/editprofile.dart';
// import 'package:early_warning/new.dart';
// import 'package:early_warning/notification.dart';
// import 'package:early_warning/profile.dart';
// import 'package:early_warning/screens/loginScreen.dart';
// import 'package:early_warning/view_animals.dart';
// import 'package:early_warning/view_contact.dart';
// import 'package:early_warning/view_notification.dart';
// import 'package:early_warning/view_profile.dart';
// import 'package:early_warning/view_reply.dart';
import 'package:eagles_123/logindesign.dart';
import 'package:eagles_123/parent/parent_view_student.dart';
import 'package:eagles_123/parent/send%20complaint.dart';
import 'package:eagles_123/parent/sendcomplaint_temp.dart';
import 'package:eagles_123/parent/view%20attendance.dart';
import 'package:eagles_123/parent/view%20authority.dart';
import 'package:eagles_123/parent/view%20reply.dart';
import 'package:eagles_123/parent/view%20student.dart';
import 'package:eagles_123/student/view_prof_new.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import '../parent/violence report.dart';
import 'change password.dart';

void main() {
  runApp(const HomeNew());
}

class HomeNew extends StatelessWidget {
  const HomeNew({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ParentHome(title: 'Home'),
    );
  }
}

class ParentHome extends StatefulWidget {
  const ParentHome({super.key, required this.title});

  final String title;

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {


  _ParentHomeState()
  {
    viewstudent();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 18, 82, 98),

          title: Text(widget.title),
        ),
        body:
        ListView.builder(

          physics: BouncingScrollPhysics(),
          // padding: EdgeInsets.all(5.0),
          // shrinkWrap: true,
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () {
                print("long press" + index.toString());
              },
              title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Image.network(
                                      image_[index],

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          name_[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(126, 29, 155, 187),
                                          ),
                                          onPressed: () async {
                                            SharedPreferences sh = await SharedPreferences.getInstance();
                                            sh.setString("sid", id_[index]);
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => MyViewReqStatus(),
                                            //   ),
                                            // );
                                          },
                                          child: Text('Attendance'),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(126, 29, 155, 187),
                                          ),
                                          onPressed: () async {
                                            SharedPreferences sh = await SharedPreferences.getInstance();
                                            sh.setString("sid", id_[index]);
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => MyViewStudentCheckinout(title: ""),
                                            //   ),
                                            // );
                                          },
                                          child: Text('CheckIn/Out'),
                                        ),
                                        Spacer(),// Use Spacer to push the next button to the right
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(126, 29, 155, 187),
                                          ),
                                          onPressed: () async {
                                            SharedPreferences sh = await SharedPreferences.getInstance();
                                            sh.setString("sid", id_[index]);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ViolenceReportPage(title: ""),
                                              ),
                                            );
                                          },
                                          child: Text('Violence'),
                                        ),
                                      ],
                                    ),
                                  )




                                ],
                              ),
                            )
                          ]
                      ),
                    ],
                  )),
            );
          },
        ),




        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 18, 82, 98),
                ),
                child:
                Column(children: [

                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 20,color: Colors.white),

                  ),
                  CircleAvatar(radius: 29,backgroundImage: NetworkImage('')),
                  Text('',style: TextStyle(color: Colors.white)),
                  // Text(uemail_,style: TextStyle(color: Colors.white)),



                ])


                ,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNew(),));
                },
              ),
              ListTile(
                leading: Icon(Icons.person_pin),
                title: const Text(' View Student '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyViewStudentProfile(title: 'View Student',),));
                },
              ),

              ListTile(
                leading: Icon(Icons.book_outlined),
                title: const Text(' View Violence Report '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViolenceReportPage(title: "Violence Report",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.note_alt_rounded),
                title: const Text(' View Student Attendance '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewstudentAttendanceParent(title: "Student Attendance",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.medical_services_outlined),
                title: const Text(' View Authority '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAuthorityPage(title: "Authority",),));
                },
              ),


              ListTile(
                leading: Icon(Icons.local_pharmacy),
                title: const Text(' Send Complaint '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MySendComplaints(title: "Complaint",),));
                },

              ),

              ListTile(
                leading: Icon(Icons.medical_information_outlined),
                title: const Text(' View Reply '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReplyPage(title: "Reply",),));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.medical_services_outlined),
              //   title: const Text(' viewcontact '),
              //   onTap: () {
              //     Navigator.pop(context);
              //    // Navigator.push(context, MaterialPageRoute(builder: (context) => ViolenceReportPage(title: "Violence Report",),));
              //   },
              // ),


              // ListTile(
              //   leading: Icon(Icons.local_pharmacy),
              //   title: const Text(' Viewreplypage '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => MyViewreplypagePage(title: 'reply'),));
              //   },
              //
              // ),
              // ListTile(
              //   leading: Icon(Icons.change_circle),
              //
              //   title: const Text(' viewnotificationpage '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => viewnotificationpagePage(title: 'notification',
              //     //
              //     // ),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.password),
                title: const Text(' Changepassword '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => parentchangepassword(title: "Change Password",),));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.shopping_cart_sharp),
              //   title: const Text(' View Cart'),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCart(),));
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.feed_outlined),
              //   title: const Text('Complaint '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReplyPage(title: "View Complaint",),));
              //   },
              // ),

              // ListTile(
              //   title: const Text(' Change Password '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => MyChangePasswordPage(title: "Change Password",),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDesignPage(title: 'Logout',),));
                },
              ),
            ],
          ),
        ),





      ),
    );
  }



  List<String> id_ = <String>[];
  List<String> name_= <String>[];

  List<String> image_= <String>[];
  Future<void> viewstudent() async {


    List<String> id = <String>[];
    List<String> name= <String>[];

    List<String> image= <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/parent_view_student/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        name.add(arr[i]['name'].toString());

        image.add(sh.getString('img_url').toString()+arr[i]['photo']);

      }

      setState(() {
        id_ = id;
        name_ = name;

        image_=image;


      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }



}
