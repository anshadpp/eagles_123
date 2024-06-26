
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../Homedesign/Home/screens/Home.dart';
import '../main.dart';
import '../staff/staff home.dart';
import 'home.dart';


void main() {
  runApp(const ViewReply());
}

class ViewReply extends StatelessWidget {
  const ViewReply({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewReplyPage(title: 'View Reply'),
    );
  }
}

class ViewReplyPage extends StatefulWidget {
  const ViewReplyPage({super.key, required this.title});

  final String title;

  @override
  State<ViewReplyPage> createState() => _ViewReplyPageState();
}

class _ViewReplyPageState extends State<ViewReplyPage> {

  _ViewReplyPageState() {
    ViewReply();
  }

  List<String> id_ = <String>[];
  List<String> date_ = <String>[];
  List<String> complaint_= <String>[];
  List<String> status_= <String>[];
  List<String> reply_= <String>[];


  Future<void> ViewReply() async {
    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> complaint = <String>[];
    List<String> status = <String>[];
    List<String> reply = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/view_reply/';

      var data = await http.post(Uri.parse(url), body: {

        'lid': lid
      });

      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        complaint.add(arr[i]['complaint']);
        status.add(arr[i]['status']);
        reply.add(arr[i]['reply']);

        setState(() {
          id_ = id;
          date_ = date;
          complaint_ = complaint;
          status_ = status;
          reply_ = reply;
        });

        print(statuss);
      }
    }
      catch (e) {
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
          //     MaterialPageRoute(builder: (context) => Home()),);
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
                                    child: Text(date_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(complaint_[index]),
                                  ),  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(status_[index]),
                                  ),Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(reply_[index]),
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
