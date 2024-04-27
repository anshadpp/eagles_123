
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../staff/staff home.dart';
import 'home.dart';


void main() {
  runApp(const ViolenceReport());
}

class ViolenceReport extends StatelessWidget {
  const ViolenceReport({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViolenceReportPage(title: 'View Reply'),
    );
  }
}

class ViolenceReportPage extends StatefulWidget {
  const ViolenceReportPage({super.key, required this.title});

  final String title;

  @override
  State<ViolenceReportPage> createState() => _ViolenceReportPageState();
}

class _ViolenceReportPageState extends State<ViolenceReportPage> {

  _ViolenceReportPageState(){
    ViolenceReport();
  }

  List<String> id_ = <String>[];
  List<String> time_= <String>[];
  List<String> date_= <String>[];
  List<String> photo_= <String>[];


  Future<void> ViolenceReport() async {
    List<String> id = <String>[];
    List<String> time = <String>[];
    List<String> date = <String>[];
    List<String> photo = <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String imgurls = sh.getString('img_url').toString();
      String lid = sh.getString('lid').toString();
      String sid = sh.getString('sid').toString();
      String url = '$urls/parent_view_violence/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'sid':sid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
       time.add(arr[i]['time']);
        date.add(arr[i]['date']);
        photo.add(imgurls+arr[i]['photo']);
      }

      setState(() {
        id_ = id;
        time_ = time;
        date_ = date;
        photo_ = photo;
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
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: BackButton(onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => ParentHome(title: '',)),);
          // },),
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          title: Text(widget.title),
        ),

        body: a(),
      ),
    );
  }a(){
    if (id_.length == 0){
      return Center(child: Text("No violence found.."),);
  }else {
      return ListView.builder(
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
                                  child: Text(time_[index]),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(date_[index]),
                                ), Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image.network(photo_[index],height: 100,),
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

      );

  }
  }
}
