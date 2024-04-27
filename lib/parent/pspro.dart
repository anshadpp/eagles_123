//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../main.dart';
// import '../staff/staff home.dart';
// import 'home.dart';
//
//
// void main() {
//   runApp(const ViewStudent());
// }
//
// class ViewStudent extends StatelessWidget {
//   const ViewStudent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'View Student',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
//         useMaterial3: true,
//       ),
//       home: const ViewStudentPage(title: 'View Student'),
//     );
//   }
// }
//
// class ViewStudentPage extends StatefulWidget {
//   const ViewStudentPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewStudentPage> createState() => _ViewStudentPageState();
// }
//
// class _ViewStudentPageState extends State<ViewStudentPage> {
//
//   _ViewStudentPageState(){
//     _send_data();
//   }
//
//   String id_ = "";
//   String name_= "";
//   String dob_= "";
//   String gender_= "";
//   String email_= "";
//   String phone_= "";
//   String course_= "";
//   String place_= "";
//   String post_= "";
//   String pin_= "";
//   String dist_= "";
//   String guardianname_= "";
//   String guardianemail_= "";
//   String guardianphone_= "";
//   // List<String> login_= <String>[];
//
//
//   void _send_data() async{
//
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//
//     final urls = Uri.parse('$url/parent_view_student/');
//     try {
//       final response = await http.post(urls, body: {
//         'lid':lid
//
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//           String name=jsonDecode(response.body)['name'];
//           String dob=jsonDecode(response.body)['DOB'].toString();
//           String gender=jsonDecode(response.body)['Gender'];
//           String course=jsonDecode(response.body)['course'];
//           String email=jsonDecode(response.body)['email'];
//           String phone=jsonDecode(response.body)['phone'].toString();
//           String place=jsonDecode(response.body)['place'];
//           String post=jsonDecode(response.body)['post'];
//           String pin=jsonDecode(response.body)['pin'].toString();
//           String district=jsonDecode(response.body)['dist'];
//           String guardianname=jsonDecode(response.body)['guardianname'];
//           String guardianphone=jsonDecode(response.body)['guardianphone'].toString();
//           String guardianemail=jsonDecode(response.body)['guardianemail'];
//
//           setState(() {
//
//             name_= name;
//             dob_= dob;
//             gender_= gender;
//             course_= course;
//             email_= email;
//             phone_= phone;
//             place_= place;
//             post_= post;
//             pin_= pin;
//             dist_= district;
//             guardianname_= guardianname;
//             guardianphone_= guardianphone;
//             guardianemail_= guardianemail;
//           });
//
//
//
//
//
//         }else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       }
//       else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     }
//     catch (e){
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//       onWillPop: () async{ return true; },
//       child: Scaffold(
//           appBar: AppBar(
//             leading: BackButton( onPressed:() {
//
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ParentHome(title: '',)),);
//
//             },),
//             backgroundColor: Theme.of(context).colorScheme.primary,
//             title: Text(widget.title),
//           ),
//           body: ListView(
//             children: [
//               ListTile(
//                 onLongPress: () {
//                 },
//                 title: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         Card(
//                           child:
//                           Row(
//                               children: [
//                                 Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(name_),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(dob_),
//                                     ),    Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(gender_),
//                                     ),  Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(email_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(phone_),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(course_),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(place_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(post_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(pin_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(dist_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(guardianname_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(guardianphone_),
//                                     ),Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Text(guardianemail_),
//                                     ),
//                                   ],
//                                 ),
//
//                               ]
//                           ),
//
//                           elevation: 8,
//                           margin: EdgeInsets.all(10),
//                         ),
//                       ],
//                     )),
//               )
//
//             ],
//           )
//
//
//
//       ),
//     );
//   }
// }
