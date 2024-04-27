

import 'package:eagles_123/parent/view%20attendance.dart';
import 'package:eagles_123/parent/violence%20report.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../parent/violence report.dart';


// import 'home.dart';

void main() {
  runApp(const ViewReply());
}

class ViewReply extends StatelessWidget {
  const ViewReply({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const MyViewStudentProfile(title: 'Reply'),
    );
  }
}

class MyViewStudentProfile extends StatefulWidget {
  const MyViewStudentProfile({super.key, required this.title});

  final String title;

  @override
  State<MyViewStudentProfile> createState() => _MyViewStudentProfileState();
}

// class _MyViewStudentProfileState extends State<MyViewStudentProfile>

class _MyViewStudentProfileState extends State<MyViewStudentProfile> {


  _MyViewStudentProfileState(){
    viewstudent();
  }

  List<String> id_ = <String>[];
  List<String> name_= <String>[];
  List<String> phone_= <String>[];
  List<String> gender_= <String>[];
  List<String> image_= <String>[];
  List<String> email_= <String>[];
  List<String> place_= <String>[];
  List<String> post_= <String>[];
  // List<String> city_= <String>[];
  List<String> dist_= <String>[];
  List<String> pin_= <String>[];
  List<String> guardianname_= <String>[];
  List<String> guardianphone_= <String>[];
  List<String> guardianemail_= <String>[];
  List<String> DOB_= <String>[];
  List<String> course_= <String>[];










  Future<void> viewstudent() async {


    List<String> id = <String>[];
    List<String> name= <String>[];
    List<String> phone= <String>[];
    List<String> gender= <String>[];
    List<String> image= <String>[];
    List<String> email= <String>[];
    List<String> place= <String>[];
    // List<String> city= <String>[];
    List<String> post= <String>[];
    List<String> dist= <String>[];
    List<String> pin= <String>[];
    List<String> guardianname= <String>[];
    List<String> guardianphone= <String>[];
    List<String> guardianemail= <String>[];
    List<String> DOB= <String>[];
    List<String> course= <String>[];




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
        email.add(arr[i]['email'].toString());
        phone.add(arr[i]['phone'].toString());
        image.add(sh.getString('img_url').toString()+arr[i]['photo']);
        gender.add(arr[i]['gender'].toString());
        place.add(arr[i]['place'].toString());
        // city.add(arr[i]['city']);
        post.add(arr[i]['post'].toString());
        dist.add(arr[i]['dist'].toString());
        pin.add(arr[i]['pin'].toString());
        guardianname.add(arr[i]['guardianname'].toString());
        guardianphone.add(arr[i]['guardianphone'].toString());
        guardianemail.add(arr[i]['guardianemail'].toString());
        DOB.add(arr[i]['DOB'].toString());
        course.add(arr[i]['course'].toString());










      }

      setState(() {
        id_ = id;
        name_ = name;
        email_ = email;
        phone_ = phone;
        gender_ = gender;
        image_=image;
        place_=place;
        // city_=city;

        post_=post;
        dist_=dist;
        pin_=pin;
        guardianname_=guardianname;
        guardianphone_=guardianphone;
        guardianemail_=guardianemail;
        DOB_=DOB;
        course_=course;



      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        // backgroundColor: Colors.orange[100],
        // body: Container(decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/images/cbc.jpg'), fit: BoxFit.cover),
        // ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(

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
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("DOB:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(DOB_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Gender:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(gender_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Email:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(email_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Phone:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(phone_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text("House Name:",
                                  //         textAlign: TextAlign.center,
                                  //
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 15.0,
                                  //           color: Colors.black
                                  //           ,
                                  //         ),),
                                  //       Text(hname_[index],
                                  //         textAlign: TextAlign.center,
                                  //
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 15.0,
                                  //           color: Colors.black
                                  //
                                  //           ,
                                  //         ),),
                                  //
                                  //     ],
                                  //   ),
                                  // ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Place:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(place_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Post:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(post_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text("City:",
                                  //         textAlign: TextAlign.center,
                                  //
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 15.0,
                                  //           color: Colors.black
                                  //
                                  //           ,
                                  //         ),),
                                  //
                                  //       Text(city_[index],
                                  //         textAlign: TextAlign.center,
                                  //
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 15.0,
                                  //           color: Colors.black
                                  //
                                  //           ,
                                  //         ),),
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("DIST:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(dist_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("guardianname:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(guardianname_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Guardianphone:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(guardianphone_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("GuardianEmail:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(guardianemail_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Course:",
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),
                                        Text(course_[index],
                                          textAlign: TextAlign.center,

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black

                                            ,
                                          ),),

                                      ],
                                    ),
                                  ),


                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Gender:",
                                  //     textAlign: TextAlign.center,
                                  //
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Email:   "+email_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Phone Number:   "+phone_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),

                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Place:   "+city_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("City:   "+city_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("District:   "+district_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("State:   "+state_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Pincode:   "+pincode_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Parentname:   "+parentname_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Parentnumber:   "+parentnumber_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Parentemail:   "+parentemail_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text("Course:   "+course_[index],
                                  //     textAlign: TextAlign.center,
                                  //
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 15.0,
                                  //       color: Colors.black
                                  //       ,
                                  //     ),),
                                  // ),
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ViewstudentAttendanceParent(title: '',),
                                              ),
                                            );
                                          },
                                          child: Text('Attendance'),
                                        ),
                                        // Spacer(),
                                        // ElevatedButton(
                                          // style: ElevatedButton.styleFrom(
                                            // backgroundColor: Color.fromARGB(126, 29, 155, 187),
                                          // ),
                                        //   onPressed: () async {
                                        //     SharedPreferences sh = await SharedPreferences.getInstance();
                                        //     sh.setString("sid", id_[index]);
                                        //     // Navigator.push(
                                        //     //   context,
                                        //     //   MaterialPageRoute(
                                        //     //     builder: (context) => MyViewStudentCheckinout(title: ""),
                                        //     //   ),
                                        //     // );
                                        //   },
                                        //   // child: Text('CheckIn/Out'),
                                        // ),
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


      ),
    );


  }
}


// {
//
//   _MyViewStudentProfileState(){
//     viewreply();
//   }
//
//
//   List<String> id_ = <String>[];
//   List<String> name_= <String>[];
//   List<String> gender_= <String>[];
//   List<String> dob_= <String>[];
//   List<String> email_= <String>[];
//   List<String> phone_= <String>[];
//   List<String> post_= <String>[];
//   List<String> place_= <String>[];
//   List<String> city_= <String>[];
//   List<String> state_= <String>[];
//   List<String> sem_= <String>[];
//   List<String> course_= <String>[];
//   List<String> pin_= <String>[];
//   List<String> photo_= <String>[];
//   List<String> pname_= <String>[];
//   List<String> pemail_= <String>[];
//   List<String> pphone_= <String>[];
//
//   Future<void> viewreply() async {
//     List<String> id = <String>[];
//     List<String> name= <String>[];
//     List<String> gender= <String>[];
//     List<String> dob= <String>[];
//     List<String> email= <String>[];
//     List<String> phone= <String>[];
//     List<String> post= <String>[];
//     List<String> place= <String>[];
//     List<String> city= <String>[];
//     List<String> state= <String>[];
//     List<String> sem= <String>[];
//     List<String> course= <String>[];
//     List<String> pin= <String>[];
//     List<String> photo= <String>[];
//     List<String> pname= <String>[];
//     List<String> pemail= <String>[];
//     List<String> pphone= <String>[];
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/user_viewstudent/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
//         'lid':lid
//
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         name.add(arr[i]['name']);
//         gender.add(arr[i]['gender']);
//         dob.add(arr[i]['dob']);
//         email.add(arr[i]['email']);
//         phone.add(arr[i]['phone']);
//         place.add(arr[i]['place']);
//         post.add(arr[i]['post']);
//         pin.add(arr[i]['pin']);
//         city.add(arr[i]['city']);
//         state.add(arr[i]['state']);
//         sem.add(arr[i]['sem']);
//         course.add(arr[i]['course']);
//         pname.add(arr[i]['pname']);
//         pemail.add(arr[i]['pemail']);
//         pphone.add(arr[i]['pphone']);
//         photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
//       }
//
//       setState(() {
//         id_ = id;
//         name_ = name;
//         gender_ = gender;
//         dob_ = dob;
//         email_ = email;
//         phone_ = phone;
//         place_ = place;
//         post_ = post;
//         pin_=pin;
//         city_=city;
//         state_=state;
//         photo_=photo;
//         pname_=pname;
//         pemail_=pemail;
//         pphone_=pphone;
//       });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async{ return true; },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackButton( onPressed:() {
//
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyHomePage(title: 'home')),);
//
//           },),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text("Post"),
//         ),
//
//         // body: Container(
//         //   decoration: BoxDecoration(
//         //
//         //     image: DecorationImage(
//         //       image: AssetImage('assets/images/cbc.jpg'), // Replace with your background image path
//         //       fit: BoxFit.cover,
//         //     ),
//         //   ),
//
//
//           body: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: id_.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Card(
//                     elevation: 8,
//                     margin: EdgeInsets.all(10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40), // Set the desired corner radius
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 20,),
//                       Container(
//                         height: 250,
//                         width: 250,
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Image(
//                             image:NetworkImage(photo_[index],scale: 2),
//
//                             fit: BoxFit.cover,
//
//                           ),
//                         ),
//                       ),
//                         Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Name:   "+name_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Dob:   "+dob_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Gender:   "+gender_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Course:   "+course_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Semester:   "+sem_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//
//
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Address: '),
//                                   Text('${place_[index]+"\n"+post_[index]+"\n"+city_[index]
//                                       +"\n"+state_[index]+"\n"+pin_[index]}'),
//                                 ],
//                               ),
//
//                             ),
//
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Email:   "+email_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Phone:   "+phone_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Parent Name:   "+pname_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Parent Email:   "+pemail_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(5),
//                               child: Text("Parent Phone:   "+pphone_[index],
//                                 textAlign: TextAlign.center,
//
//                                 style: TextStyle(
//                                   // fontWeight: FontWeight.bold,
//                                   fontSize: 15.0,
//                                   color: Colors.black
//
//                                   ,
//                                 ),),
//                             ),
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color.fromARGB(
//                                     126, 29, 155, 187),
//                               ),
//                               onPressed: () async {
//                                 SharedPreferences sh = await SharedPreferences.getInstance();
//                                 sh.setString("sid", id_[index]);
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MyViewStudentCheckinout(title:""),
//                                   ),
//                                 );
//                               },
//                               child: Text('CheckIn/Out'),
//                             ),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//
//
//
//
//
//
//           // child: ListView.builder(
//           //     physics: BouncingScrollPhysics(),
//           //     // padding: EdgeInsets.all(5.0),
//           //     // shrinkWrap: true,
//           //     itemCount: id_.length,
//           //     itemBuilder: (BuildContext context, int index) {
//           //       return ListTile(
//           //         onLongPress: () {
//           //           print("long press" + index.toString());
//           //         },
//           //         title: Padding(
//           //             padding: const EdgeInsets.all(8.0),
//           //             child: Column(
//           //               children: [
//           //                 Card(
//           //                   elevation: 8,
//           //                   margin: EdgeInsets.all(10),
//           //                   child:
//           //                   Row(
//           //                       children: [
//           //                         Column(
//           //                           children: [
//           //                             Image(
//           //
//           //                               image: NetworkImage(photo_[index], scale: 2),
//           //                               height: 250,
//           //                               width: 250,
//           //
//           //                             ),
//           //                             Padding(
//           //                               padding: EdgeInsets.all(5),
//           //                               child: Text(date_[index]),
//           //                             ),
//           //                             Padding(
//           //                               padding: EdgeInsets.all(5),
//           //                               child: Text(name_[index]),
//           //                             ),
//           //
//           //
//           //                             Padding(
//           //                               padding: EdgeInsets.all(5),
//           //                               child: Text(desc_[index]),
//           //                             ),
//           //
//           //
//           //
//           //
//           //
//           //                             ElevatedButton(onPressed: () async{
//           //                               SharedPreferences sh=await SharedPreferences.getInstance();
//           //                               sh.setString("pid",id_[index] );
//           //                               Navigator.push(context, MaterialPageRoute(
//           //                                 builder: (context) => MyViewCommentsPage(title: "comments",),));
//           //
//           //
//           //                             },
//           //                                 child:
//           //                                 Text('comments')
//           //                             )
//           //
//           //                           ],
//           //                         ),
//           //
//           //                       ]
//           //                   ),
//           //                 ),
//           //               ],
//           //             )),
//           //       );
//           //     },
//           //   ),
//           // floatingActionButton: FloatingActionButton(onPressed: () {
//           //
//           //   Navigator.push(
//           //       context,
//           //       MaterialPageRoute(builder: (context) => AddPost(title: 'home')));
//           //
//           // },
//           //   child: Icon(Icons.plus_one),
//           // ),
//
//         ),
//       // ),
//     );
//   }
// }