import 'dart:async';
import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eagles_123/Homedesign/Home/screens/SeeAll.dart';
import 'package:eagles_123/Homedesign/Home/widgets/text_widget.dart';
import 'package:eagles_123/logindesign.dart';
import 'package:eagles_123/parent/change%20password.dart';
import 'package:eagles_123/parent/parent_view_student.dart';
import 'package:eagles_123/parent/sendcomplaint_temp.dart';
import 'package:eagles_123/parent/view%20attendance.dart';
import 'package:eagles_123/parent/view%20authority.dart';
import 'package:eagles_123/parent/view_reply_temp.dart';
import 'package:eagles_123/parent/violence%20report.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var opacity = 0.0;
  bool position = false;

  String user_name_ = "";
  String user_photo_ = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();

      view_movies();
      setState(() {});
    });
  }

  animator() {
    if (opacity == 1) {
      opacity = 0;
      position = false;
    } else {
      opacity = 1;
      position = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 30, left: 0, right: 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: position ? 1 : 100,
                right: 20,
                left: 20,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: opacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 25,
                              //   backgroundImage: NetworkImage(user_photo_),
                              // ),
                              Column(
                                children: [
                                  TextWidget(
                                      "Hello",
                                      17,
                                      Colors.black.withOpacity(.7),
                                      FontWeight.bold),
                                  TextWidget(user_name_, 25, Colors.black,
                                      FontWeight.bold),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginDesignPage(title: '',),
                              ));
                        },
                        // Optionally, you can specify the icon's size and color
                        iconSize: 40,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                top: position ? 80 : 140,
                left: 20,
                right: 20,
                duration: const Duration(milliseconds: 400),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: opacity,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                  top: position ? 400 : 220,
                  right: 20,
                  left: 20,
                  duration: const Duration(milliseconds: 400),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: opacity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.blue.shade700,
                                  Colors.blue.shade900,
                                  Colors.blue.shade900,
                                ])),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 25,
                                left: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const CircleAvatar(
                                    //   backgroundColor: Colors.white,
                                    //   radius: 30,
                                      // child: Center(
                                      //   // child: Image(
                                      //   //   fit: BoxFit.fill,
                                      //   //   image: AssetImage(
                                      //   //       'assets/images/rent.png'),
                                      //   // ),
                                      // ),
                                    // ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextWidget(
                                          "Welcome",
                                          15,
                                          Colors.black,
                                          FontWeight.normal,
                                          letterSpace: 1,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              "Violence",
                                              15,
                                              Colors.black,
                                              FontWeight.bold,
                                              letterSpace: 2,
                                            ),
                                            TextWidget(
                                              "Detection System",
                                              15,
                                              Colors.black,
                                              FontWeight.bold,
                                              letterSpace: 2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            Positioned(
                                top: 100,
                                left: 20,
                                child: Container(
                                  height: 1,
                                  width: 300,
                                  color: Colors.white.withOpacity(.5),
                                )),
                            Positioned(
                                top: 115,
                                left: 20,
                                right: 1,
                                child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      TextWidget(
                                          "", 15, Colors.white, FontWeight.bold,
                                          letterSpace: 1),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                       Expanded(
                                        child: Stack(
                                          // children: [
                                          //   Positioned(
                                          //     child: CircleAvatar(
                                          //       radius: 15,
                                          //       backgroundColor: Colors.blue,
                                          //     ),
                                          //   ),
                                            // Positioned(
                                            //   left: 20,
                                            //   child: CircleAvatar(
                                            //     radius: 15,
                                            //     backgroundColor: Colors.red,
                                            //   ),
                                            // ),
                                            // Positioned(
                                            //   left: 40,
                                            //   child: CircleAvatar(
                                            //     radius: 15,
                                            //     backgroundColor: Colors.white,
                                            //   ),
                                            // )
                                          // ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            // const Positioned(
                            //     top: 10,
                            //     right: 10,
                            //     child: Icon(
                            //       Icons.close_outlined,
                            //       color: Colors.white,
                            //       size: 15,
                            //     ))
                          ],
                        ),
                      ),
                    ),
                  )),
              categoryRow(),
              AnimatedPositioned(
                  top: position ? 200 : 500,
                  left: 20,
                  right: 20,
                  duration: const Duration(milliseconds: 400),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: opacity,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            "",
                            25,
                            Colors.black.withOpacity(.8),
                            FontWeight.bold,
                            letterSpace: 0,
                          ),
                          InkWell(
                              onTap: () async {
                                animator();
                                setState(() {});
                                // Timer(Duration(seconds: 1),() {
                                //   Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAll(),));
                                //   animator();
                                // },);
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                await Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SeeAll();
                                  },
                                ));

                                setState(() {
                                  animator();
                                });
                              },
                              child: Text("")),
                          // TextWidget("See all", 15, Colors.blue.shade600.withOpacity(.8), FontWeight.bold,letterSpace: 0,)),
                        ],
                      ),
                    ),
                  )),
              AnimatedPositioned(
                  bottom: 1,
                  left: position ? 50 : 150,
                  duration: const Duration(milliseconds: 400),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: opacity,
                    child: Container(
                      height: 450,
                      width: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/akfor.png'),
                              fit: BoxFit.fill)),
                    ),
                  )),
              doctorList(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: opacity,
                    child: CurvedNavigationBar(
                        onTap: (value) {
                          if (value == 0) {}
                          if (value == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MySendComplaints(title: '',

                                  ),
                                ));
                          }
                          if (value == 2) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReplyPage(title: '',),));
                          }
                          if (value == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => parentchangepassword(title: '',),
                                ));
                          }
                        },
                        backgroundColor: Colors.white,
                        items: const [
                          Icon(
                            Icons.home_filled,
                            color: Colors.black,
                            size: 30,
                          ),
                          Icon(
                            Icons.feedback,
                            color: Colors.black,
                            size: 30,
                          ),
                          Icon(
                            Icons.reply,
                            color: Colors.black,
                            size: 30,
                          ),
                          Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 30,
                          ),
                        ]),
                  ))
            ],
          ),
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
                CircleAvatar(radius: 29,backgroundImage: NetworkImage('')),
                Text('',style: TextStyle(color: Colors.white)),
                // Text(uemail_,style: TextStyle(color: Colors.white)),



              ])


              ,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_pin),
              title: const Text(' View Student '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyViewStudentProfile(title: 'View Student',),));
              },
            ),

            ListTile(
              leading: Icon(Icons.book_outlined),
              title: const Text(' View Violence Report '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViolenceReportPage(title: "Violence Report",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.note_alt_rounded),
              title: const Text(' View Student Attendance '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewstudentAttendanceParent(title: "Student Attendance",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: const Text(' View Authority '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAuthorityPage(title: "Authority",),));
              },
            ),


            ListTile(
              leading: Icon(Icons.local_pharmacy),
              title: const Text(' Send Complaint '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MySendComplaints(title: "Complaint",),));
              },

            ),

            ListTile(
              leading: Icon(Icons.medical_information_outlined),
              title: const Text(' View Reply '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReplyPage(title: "Reply",),));
              },
            ),

            ListTile(
              leading: Icon(Icons.password),
              title: const Text(' Changepassword '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => parentchangepassword(title: "Change Password",),));
              },
            ),

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


    );
  }

  void view_movies() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    final urls = Uri.parse(url + "/parent_view_student/");
    try {
      final response = await http.post(urls, body: {
        'lid': lid,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Success');

          setState(() {
            user_name_ = jsonDecode(response.body)['guardianname']; //

            user_photo_ = sh.getString('img_url').toString() +
                jsonDecode(response.body)['photo'];
          });
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  AnimatedPositioned doctorList() {
    return AnimatedPositioned(
        top: position ? 460 : 550,
        left: 20,
        right: 20,
        duration: const Duration(milliseconds: 400),
        child: Column(
          children: [],
        ));
  }

  Widget doctorCard(String name, String specialist, NetworkImage image) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: image,
              backgroundColor: Colors.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  name,
                  20,
                  Colors.black,
                  FontWeight.bold,
                  letterSpace: 0,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  specialist,
                  17,
                  Colors.black,
                  FontWeight.bold,
                  letterSpace: 0,
                ),
                const SizedBox(
                  height: 5,
                ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(Icons.star,color: Colors.orangeAccent,),
                //     Icon(Icons.star,color: Colors.orangeAccent,),
                //     Icon(Icons.star,color: Colors.orangeAccent,),
                //     Icon(Icons.star,color: Colors.orangeAccent,),
                //     Icon(Icons.star,color: Colors.orangeAccent,),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryRow() {
    return AnimatedPositioned(
        top: position ? 200 : 420,
        left: 25,
        right: 25,
        duration: const Duration(milliseconds: 400),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: opacity,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                category("assets/images/user.png", "Student", 5),
                category1("assets/images/placeholder.png", "Authority", 10),
                category2("assets/images/booking.png", "Notification", 10),
                // category3("assets/images/mydres.png", "Timeline", 12),
              ],
            ),
          ),
        ));
  }

  Widget category(String asset, String txt, double padding) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyViewStudentProfile(
                    title: '',
                  ),
                ));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(asset),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
          txt,
          16,
          Colors.black,
          FontWeight.bold,
          letterSpace: 1,
        ),
      ],
    );
  }

  Widget category1(String asset, String txt, double padding) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAuthorityPage(title: '',),
                ));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(asset),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
          txt,
          16,
          Colors.black,
          FontWeight.bold,
          letterSpace: 1,
        ),
      ],
    );
  }

  Widget category2(String asset, String txt, double padding) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ViolenceReportPage(title: '',),));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(asset),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
          txt,
          16,
          Colors.black,
          FontWeight.bold,
          letterSpace: 1,
        ),
      ],
    );
  }

  Widget category3(String asset, String txt, double padding) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Viewtimeline(title: '',),));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(asset),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
          txt,
          16,
          Colors.black,
          FontWeight.bold,
          letterSpace: 1,
        ),
      ],
    );
  }

  a() {
    List<Widget> s = [];
    return s;
  }
}
