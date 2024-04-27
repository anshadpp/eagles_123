import 'dart:convert';

import 'package:eagles_123/Homedesign/Home/screens/Home.dart';
import 'package:eagles_123/home/widgets/inputTextWidget.dart';
import 'package:eagles_123/parent/home.dart';
import 'package:eagles_123/staff/staff%20home.dart';
import 'package:eagles_123/student/student%20home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginDesignPage(title: 'Login'),
    );
  }
}

class LoginDesignPage extends StatefulWidget {
  const LoginDesignPage({super.key, required this.title});

  final String title;

  @override
  State<LoginDesignPage> createState() => _LoginDesignPageState();
}

class _LoginDesignPageState extends State<LoginDesignPage> {


  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override




  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double r = (175 / 360); //  rapport for web test(304 / 540);
    final coverHeight = screenWidth * r;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;

    final widgetList = [
      Row(
        children: [
          SizedBox(
            width: 55,
          ),
          Text(

            'Eagles  Eye',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xff571dbb),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      SizedBox(
        height: 50.0,
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextWidget(
                  controller: nameController,
                  labelText: "Email",
                  icon: Icons.email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 12.0,
              ),
              InputTextWidget(
                  controller: passwordController,
                  labelText: "password",
                  icon: Icons.lock,
                  obscureText: true,
                  keyboardType: TextInputType.text),

              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _send_data();
                    }
                    //Get.to(ChoiceScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0.0,
                    minimumSize: Size(screenWidth, 150),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.blueGrey,
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                        color: Colors.blueGrey, // Color(0xffF05945),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
      SizedBox(
        height: 15.0,
      ),
      Wrap(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 30.0, right: 10.0, top: 15.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         boxShadow: <BoxShadow>[
          //           BoxShadow(
          //               color: Colors.grey, //Color(0xfff05945),
          //               offset: const Offset(0, 0),
          //               blurRadius: 5.0),
          //         ],
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12.0)),
          //     width: (screenWidth / 2) - 40,
          //     height: 55,
          //     child: Material(
          //       borderRadius: BorderRadius.circular(12.0),
          //       child: InkWell(
          //         onTap: () {
          //           print("facebook tapped");
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             children: [
          //               Image.asset("assests/images/fb.png", fit: BoxFit.cover),
          //               SizedBox(
          //                 width: 7.0,
          //               ),
          //               Text("Sign in avec\nfacebook")
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10.0, right: 30.0, top: 15.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         boxShadow: <BoxShadow>[
          //           BoxShadow(
          //               color: Colors.grey, //Color(0xfff05945),
          //               offset: const Offset(0, 0),
          //               blurRadius: 5.0),
          //         ],
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12.0)),
          //     width: (screenWidth / 2) - 40,
          //     height: 55,
          //     child: Material(
          //       borderRadius: BorderRadius.circular(12.0),
          //       child: InkWell(
          //         onTap: () {
          //           print("google tapped");
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             children: [
          //               // Image.asset("assests/images/google.png",
          //               //     fit: BoxFit.cover),
          //               SizedBox(
          //                 width: 7.0,
          //               ),
          //               Text("Sign in avec\nGoogle")
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      SizedBox(
        height: 15.0,
      ),
    ];
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePageIP(title: "Ip"),
            ));
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              leading: SizedBox(),
              floating: _floating,
              expandedHeight: coverHeight - 25,
              //304,
              backgroundColor: Color(0xFFdccdb4),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.asset("assets/images/login.jpg", fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    gradient: LinearGradient(
                        colors: <Color>[Color(0xFFdccdb4), Color(0xFFd8c3ab)])),
                width: screenWidth,
                height: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: screenWidth,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(30.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return widgetList[index];
                    }, childCount: widgetList.length))
          ],
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async
  //     {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => MyIpPage(title: "ip",),));
  //       return false;
  //     },
  //     child: Scaffold(
  //       appBar: AppBar(
  //         centerTitle: true,
  //         backgroundColor: Colors.blueGrey,
  //         title: Text(widget.title),
  //       ),
  //       body: SingleChildScrollView(
  //         child: Center(
  //
  //           child: Form(
  //             key: _formkey,
  //
  //
  //
  //
  //             child: Container(
  //               width: 320,
  //
  //               child: Column(
  //
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //
  //                   SizedBox(
  //                     height: 200,
  //                   ),
  //
  //
  //                   Padding(padding: EdgeInsets.all(5),
  //                     child:
  //
  //
  //                     TextFormField(
  //                       validator: (value) => validateUsername(value!),
  //
  //                       controller: nameController,
  //
  //                       decoration: InputDecoration(
  //                           border: OutlineInputBorder(), labelText: 'username'
  //                       ),
  //                     ),
  //                   ),
  //
  //
  //                   Padding(padding: EdgeInsets.all(5),
  //                     child:
  //                     TextField(
  //                       controller: passwordController,
  //                       decoration: InputDecoration(
  //
  //                           border: OutlineInputBorder(),
  //                           labelText: 'password'),
  //                     ),
  //
  //                   ),
  //
  //                   Container(
  //                     width: 300,
  //                     padding: const EdgeInsets.all(5),
  //
  //                     child: ElevatedButton(
  //                           style: ElevatedButton.styleFrom(
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(25),
  //                             ),
  //                             backgroundColor: Colors.blueGrey,
  //                           ),
  //                           onPressed: () {
  //                       if(_formkey.currentState!.validate()){
  //                         senddata();
  //                       }
  //                     },
  //                         child:
  //                         Text('login')
  //
  //
  //                     ),
  //                   ),
  //                 ],
  //
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _send_data() async{


    String uname=nameController.text;
    String password=passwordController.text;



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/andLogin/');
    try {
      final response = await http.post(urls, body: {
        'username':uname,
        'password':password,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];

        if (status=='ok') {
          String type=jsonDecode(response.body)['type'];
          sh.setString('types', type);
          String lid=jsonDecode(response.body)['lid'].toString();
          sh.setString("lid", lid);
          if(type=='parent') {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Home(),));
          }
          else if(type=='student'){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => StudentHome(title: "Home"),));
          }
          else if(type=='staff'){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => StaffHome(title: "Home"),));
          }
          else{
            Fluttertoast.showToast(msg: 'Not Found');

          }
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

  String? validateUsername(String value){
    if(value.isEmpty) {
      return 'Please fill';
    }
    return null;
  }
}