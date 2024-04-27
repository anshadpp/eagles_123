// import 'package:scrapnet/homenew.dart';
import 'package:eagles_123/constants.dart';
import 'package:eagles_123/parent/home.dart';
import 'package:eagles_123/parent/sendcomplaint_temp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../Homedesign/Home/screens/Home.dart';


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

  _ViewReplyPageState(){
    viewreply();
  }

  List<String> id_ = <String>[];
  List<String> date_= <String>[];
  List<String> complaint_= <String>[];
  List<String> reply_= <String>[];
  List<String> status_= <String>[];


  Future<void> viewreply() async {

    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> complaint = <String>[];
    List<String> reply = <String>[];
    List<String> status = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/view_reply/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date']);
        complaint.add(arr[i]['complaint']);
        reply.add(arr[i]['reply']);
        status.add(arr[i]['status']);
      }

      setState(() {
        id_ = id;
        date_ = date;
        complaint_ = complaint;
        reply_ = reply;
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
      onWillPop: () async{Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
      return false; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( ),
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Color.fromARGB(255, 82, 94, 97),


          title: Text("Reply " ,style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w600),
          ),),

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
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                    Container(
                      width: 400,
                      child: Card(
                      elevation: 6,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        color: kGinColor,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date: " + date_[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Complaint: " + complaint_[index],
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Reply: " + reply_[index],
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Status: " + status_[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: status_[index] == "replied"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                    ),



                      // Card(
                      //   child:
                      //   Row(
                      //       children: [
                      //         Column(
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsets.all(5),
                      //               child: Text("Date: "+date_[index]),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.all(5),
                      //               child: Text("Complaint: "+complaint_[index]),
                      //             ),    Padding(
                      //               padding: EdgeInsets.all(5),
                      //               child: Text("Reply: "+reply_[index]),
                      //             ),  Padding(
                      //               padding: EdgeInsets.all(5),
                      //               child: Text("Status: "+status_[index]),
                      //             ),
                      //           ],
                      //         ),
                      //
                      //       ]
                      //   ),
                      //
                      //   elevation: 6,
                      // ),
                    ],
                  )),
            );
          },
        ),
       floatingActionButton: FloatingActionButton(onPressed: () {

         Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => MySendComplaints(title: "",)));

       },
         child: Icon(Icons.add),
       ),


      ),
    );
  }
}
