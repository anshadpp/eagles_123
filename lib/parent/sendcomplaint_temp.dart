import 'dart:convert';

import 'package:eagles_123/Homedesign/Home/screens/Home.dart';
import 'package:eagles_123/parent/view%20reply.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complaints',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MySendComplaints(title: 'complaints'),
    );
  }
}

class MySendComplaints extends StatefulWidget {
  const MySendComplaints({super.key, required this.title});



  final String title;

  @override
  State<MySendComplaints> createState() => _MySendComplaintsState();
}

class _MySendComplaintsState extends State<MySendComplaints> {
  TextEditingController complaintcontroller=new TextEditingController();
  final _formKey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
        return false;
      },

      child: Scaffold(
        backgroundColor: Color.fromARGB(250, 30, 90, 105), // Set the background color here

        // appBar: AppBar(
        //
        //   backgroundColor: Colors.brown,
        //   foregroundColor: Colors.orange[700],
        //
        //   title: Text(widget.title),
        // ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.jpg'), fit: BoxFit.cover),
          ),
          child: Center(

            child: Form(
              key: _formKey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) => Validatecomplaints(value!),

                      controller: complaintcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'complaint',
                        fillColor: Colors.grey.shade300,
                        filled: true,


                      ),
                      maxLines: 10, // Set this to null for a multiline TextField
                    ),
                  ),


                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(126, 29, 155, 187),

                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          sendata();}}, child: Text('send'))

                ],
              ),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => MyViewReplyPage(title: 'home')));
        //
        // },
        //   backgroundColor: Color.fromARGB(234, 100, 68, 28),
        //   child: Icon(Icons.home_filled),
        // ),

      ),
    );
  }
  void sendata()async{
    String complaint=complaintcontroller.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/send_complaint/');
    try {
      final response = await http.post(urls, body: {
        'complaint':complaint,
        'lid':sh.getString("lid").toString(),

      });
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        print(status);
        if (status=='ok') {


          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ViewReplyPage(title: "Home"),));
          Fluttertoast.showToast(msg: 'success');

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
  String? Validatecomplaints(String value){
    if(value.isEmpty){
      return 'please enter your complaints';
    }
    return null;
  }
}