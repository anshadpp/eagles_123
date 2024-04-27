
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../staff/staff home.dart';
import 'chat.dart';
import 'home.dart';


void main() {
  runApp(const ViewAuthority());
}

class ViewAuthority extends StatelessWidget {
  const ViewAuthority({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Authority',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewAuthorityPage(title: 'View Authority'),
    );
  }
}

class ViewAuthorityPage extends StatefulWidget {
  const ViewAuthorityPage({super.key, required this.title});

  final String title;

  @override
  State<ViewAuthorityPage> createState() => _ViewAuthorityPageState();
}

class _ViewAuthorityPageState extends State<ViewAuthorityPage> {

  _ViewAuthorityPageState(){
    ViewAuthority();
  }

  List<String> id_ = <String>[];
  List<String> LOGIN_id_ = <String>[];
  List<String> name_= <String>[];
  List<String> email_= <String>[];
  List<String> phone_= <String>[];
  // List<String> login_= <String>[];


  Future<void> ViewAuthority() async {
    List<String> id = <String>[];
    List<String> LOGIN_id = <String>[];
    List<String> name = <String>[];
    List<String> email = <String>[];
    List<String> phone = <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/parent_view_authority/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        LOGIN_id.add(arr[i]['LOGIN_id'].toString());
        name.add(arr[i]['name']);
        email.add(arr[i]['email']);
        phone.add(arr[i]['phone'].toString());
      }

      setState(() {
        id_ = id;
        LOGIN_id_=LOGIN_id;
        name_ = name;
        email_ = email;
        phone_ = phone;
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
          // leading: BackButton( onPressed:() {
          //
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => ParentHome(title: '',)),);
          //
          // },),
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
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(name_[index]),
                                  ), Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(email_[index]),
                                  ),Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(phone_[index]),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {


                                      SharedPreferences sh=await SharedPreferences.getInstance();
                                      sh.setString("aid", LOGIN_id_[index]).toString();


                                      Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyChatPage(title: '',)),
                                              );

                                    },
                                    child: Text("chat"),
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

