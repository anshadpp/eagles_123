
import 'package:eagles_123/student/student%20home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../parent/home.dart';


void main() {
  runApp(const ViewAttendance());
}

class ViewAttendance extends StatelessWidget {
  const ViewAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Attendance',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewStudentAttendance(title: 'View Attendance'),
    );
  }
}

class ViewStudentAttendance extends StatefulWidget {
  const ViewStudentAttendance({super.key, required this.title});

  final String title;

  @override
  State<ViewStudentAttendance> createState() => _ViewStudentAttendanceState();
}

class _ViewStudentAttendanceState extends State<ViewStudentAttendance> {

  _ViewStudentAttendanceState(){
    ViewAttendance();
  }

  List<String> id_ = <String>[];
  // List<String> name_= <String>[];
  List<String> date_= <String>[];
  List<String> time_= <String>[];
  List<String> photo_= <String>[];
  List<String> status_= <String>[];


  Future<void> ViewAttendance() async {
    List<String> id = <String>[];
    // List<String> name = <String>[];
    List<String> date = <String>[];
    List<String> time = <String>[];
    List<String> photo = <String>[];
    List<String> status = <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/student_view_attendance/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });

      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        // name.add(arr[i]['name']);
        date.add(arr[i]['date']);
        time.add(arr[i]['time']);
        photo.add(sh.getString('img_url').toString()+arr[i]['photo']);
        status.add(arr[i]['status']);
      }

      setState(() {
        id_ = id;
        // name_ = name;
        date_ = date;
        time_ = time;
        photo_ = photo;
        status_ = status;
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
        appBar: AppBar(
          leading: BackButton( onPressed:() {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentHome(title: '',)),);

          },),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
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
                      Card(
                        child:
                        Row(
                            children: [
                              Column(
                                children: [
                                  // Padding(
                                    // padding: EdgeInsets.all(5),
                                    // child: Text(name_[index]),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(date_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(time_[index]),
                                  ),  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Image.network(photo_[index],height: 100),
                                  ),Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(status_[index]),
                                  ),
                                 
                                ],
                              ),

                            ]
                        ),

                        elevation: 8,
                        margin: EdgeInsets.all(10),
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
