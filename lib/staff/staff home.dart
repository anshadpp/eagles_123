


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
import 'package:eagles_123/staff/view%20attendance.dart';
import 'package:eagles_123/staff/view%20violence.dart';
import 'package:eagles_123/staff/view_prof.dart';
// import 'package:eagles_123/student/view_prof_new.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
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
      home: const StaffHome(title: 'Home'),
    );
  }
}

class StaffHome extends StatefulWidget {
  const StaffHome({super.key, required this.title});

  final String title;

  @override
  State<StaffHome> createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {

  String name_="";
  String dob_="";
  String gender_="";
  String department_="";
  String email_="";
  String phone_="";
  String place_="";
  String post_="";
  String pin_="";
  String image_="";
  // String guardianname_="";
  // String guardianphone_="";
  // String guardianemail_="";

  void _send_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/staff_view_profile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String name=jsonDecode(response.body)['name'].toString();
          String dob=jsonDecode(response.body)['DOB'].toString();
          String gender=jsonDecode(response.body)['Gender'].toString();
          String department=jsonDecode(response.body)['department'].toString();
          String email=jsonDecode(response.body)['email'].toString();
          String phone=jsonDecode(response.body)['phone'].toString();
          String place=jsonDecode(response.body)['place'].toString();
          String post=jsonDecode(response.body)['post'].toString();
          String pin=jsonDecode(response.body)['pin'].toString();
          String image=sh.getString('img_url').toString()+jsonDecode(response.body)['photo'];
          // String guardianname=jsonDecode(response.body)['guardianname'].toString();
          // String guardianphone=jsonDecode(response.body)['guardianphone'].toString();
          // String guardianemail=jsonDecode(response.body)['guardianemail'].toString();

          setState(() {

            name_= name;
            dob_= dob;
            gender_= gender;
            department_= department;
            email_= email;
            phone_= phone;
            place_= place;
            post_= post;
            pin_= pin;
            image_= image;
            // guardianname_= guardianname;
            // guardianphone_= guardianphone;
            // guardianemail_= guardianemail;

          });





        }else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }





  String uname_="";
  // String uemail_="";
  String uphoto_="";


  _StaffHomeState()
  {
    a();
    _send_data();
  }

  a()
  async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String name = sh.getString('name_').toString();
    // String email = sh.getString('email').toString();
    String photo =sh.getString("img_url").toString()+ sh.getString('photo').toString();


    setState(() {
      uname_=name;
      // uemail_=email;
      uphoto_=photo;

    });


  }


  TextEditingController unameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

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
        SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.network(
                  image_,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 110.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            name_,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),

                                          SizedBox(
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      // CircleAvatar(
                                      //   backgroundColor: Colors.blueAccent,
                                      //   child: IconButton(
                                      //       onPressed: () {
                                      //         Navigator.push(context, MaterialPageRoute(builder: (context) =>MyeditPage(title: "Edit"),));
                                      //
                                      //       },
                                      //       icon: Icon(
                                      //         Icons.edit_outlined,
                                      //         color: Colors.white,
                                      //         size: 18,
                                      //       )),
                                      // )
                                    ],
                                  )),
                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [Text(gender_), Text("Gender")],
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Column(
                                  //     children: [Text(age_), Text("Age")],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      image_),
                                  fit: BoxFit.cover)),
                          margin: EdgeInsets.only(left: 20.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Profile Information"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Email"),
                            subtitle: Text(email_),
                            leading: Icon(Icons.mail_outline),
                          ),
                          ListTile(
                            title: Text("Phone"),
                            subtitle: Text(phone_),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("Address"),
                            subtitle: Text(
                                '$place_, $post_, $pin_'),
                            leading: Icon(Icons.map),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Positioned(
              //   top: 60,
              //   left: 20,
              //   child: MaterialButton(
              //     minWidth: 0.2,
              //     elevation: 0.2,
              //     color: Colors.white,
              //     child: const Icon(Icons.arrow_back_ios_outlined,
              //         color: Colors.indigo),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
            ],
          ),
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
                  CircleAvatar(radius: 29,backgroundImage: NetworkImage(image_)),
                  Text(name_,style: TextStyle(color: Colors.white)),
                  // Text(uemail_,style: TextStyle(color: Colors.white)),



                ])


                ,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StaffHome(title: 'home'),));
                },
              ),
              ListTile(
                leading: Icon(Icons.person_pin),
                title: const Text(' View Profile '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => staffviewprofile(title: 'View Profile',),));
                },
              ),

              // ListTile(
              //   leading: Icon(Icons.person_pin_outlined),
              //   title: const Text(' viewanimal '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => viewagency(title: 'search ',),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.person_pin_outlined),
                title: const Text(' View Attendance '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAttendancePage(title: "View Attendance",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.book_outlined),
                title: const Text(' View Violence Report '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViolenceReport1(title: ''),));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => staffchangepassword(title: "Change Password",),));
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




}

