import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewProfile());
}

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewProfilePage(title: 'View Profile'),
    );
  }
}

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {

  _ViewProfilePageState()
  {
    _send_data();
  }
  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              CircleAvatar(radius: 50,),
              Column(
                children: [
                  // Image(image: NetworkImage(photo_),height: 200,width: 200,),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(name_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(dob_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(gender_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(course_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(email_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(phone_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(place_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(post_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(pin_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(district_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(guardianname_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(guardianphone_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(guardianemail_),
                  ),

                ],
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => MyEditPage(title: "Edit Profile"),));
              //   },
              //   child: Text("Edit Profile"),
              // ),

            ],
          ),
        ),
      ),
    );
  }


  String name_="";
  String dob_="";
  String gender_="";
  String course_="";
  String email_="";
  String phone_="";
  String place_="";
  String post_="";
  String pin_="";
  String district_="";
  String guardianname_="";
  String guardianphone_="";
  String guardianemail_="";

  void _send_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/myapp/user_viewprofile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String name=jsonDecode(response.body)['name'];
          String dob=jsonDecode(response.body)['DOB'];
          String gender=jsonDecode(response.body)['Gender'];
          String course=jsonDecode(response.body)['course'];
          String email=jsonDecode(response.body)['email'];
          String phone=jsonDecode(response.body)['phone'];
          String place=jsonDecode(response.body)['place'];
          String post=jsonDecode(response.body)['post'];
          String pin=jsonDecode(response.body)['pin'];
          String district=jsonDecode(response.body)['dist+'];
          String guardianname=jsonDecode(response.body)['guardianname'];
          String guardianphone=jsonDecode(response.body)['guardianphone'];
          String guardianemail=jsonDecode(response.body)['guardianemail'];

          setState(() {

            name_= name;
            dob_= dob;
            gender_= gender;
            course_= course;
            email_= email;
            phone_= phone;
            place_= place;
            post_= post;
            pin_= pin;
            district_= district;
            guardianname_= guardianname;
            guardianphone_= guardianphone;
            guardianemail_= guardianemail;
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
}
