import 'package:eagles_123/logindesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(


      callbackDispatcher,

      isInDebugMode: true);
  Workmanager().registerPeriodicTask(
      "2",

      "simplePeriodicTask",

      frequency: Duration(seconds: 15),
  );
  runApp(const MyApp());
}


void callbackDispatcher(String message) {
  print("hiii");

  // Workmanager().executeTask((task, inputData) {
  // initialise the plugin of flutterlocalnotifications.
  FlutterLocalNotificationsPlugin flip =
  new FlutterLocalNotificationsPlugin();

  // app_icon needs to be a added as a drawable
  // resource to the Android head project.
  var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  // var IOS = new IOSInitializationSettings();

  // initialise settings for both Android and iOS device.
  var settings = new InitializationSettings(android: android);
  flip.initialize(settings);
  _showNotificationWithDefaultSound(flip, message);
  // return Future.value(true);
  // });
}

Future _showNotificationWithDefaultSound(flip,String message) async {
// Show a notification after every 15 minute with the first
// appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name',
      importance: Importance.max, priority: Priority.high);

// initialise channel platform for both Android and iOS device.
  var platformChannelSpecifics =
  new NotificationDetails(android: androidPlatformChannelSpecifics);
  await flip.show(
      0,
      'REMINDER',
      message,
      platformChannelSpecifics,
      payload: 'Default_Sound');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePageIP(title: 'IP'),
    );
  }
}

class MyHomePageIP extends StatefulWidget {
  const MyHomePageIP({super.key, required this.title});


  final String title;

  @override
  State<MyHomePageIP> createState() => _MyHomePageIPState();
}

class _MyHomePageIPState extends State<MyHomePageIP> {

  TextEditingController ipcontroller=new TextEditingController();


  _MyHomePageIPState(){
    Timer.periodic(Duration(seconds: 5), (timer) {getdata();});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/leaves.jpg'), fit: BoxFit.cover),
        ),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: ipcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      // enabledBorder: ,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),labelText: 'ip'
                  ),
                ),),
              ElevatedButton(onPressed: ()async{
                SharedPreferences Sh = await SharedPreferences.getInstance();
                Sh.setString('url', 'http://'+ipcontroller.text+":8000/myapp");
                Sh.setString('img_url', 'http://'+ipcontroller.text+":8000");
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDesignPage(title:'Login'),));
                getdata();
              }, child: Text('SEND'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getdata() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    try {


      String url = sh.getString('url').toString();
      String types = sh.getString('types').toString();

      var urls = Uri.parse('$url/get_alert/');
      if (types == 'staff'){
        urls = Uri.parse('$url/get_alert_staff/');
      }

      String nid="0";
      if(sh.containsKey("nid")==false) {}
      else{
        nid=sh.getString('nid').toString();
      }

      var datas = await http
          .post(urls, body: {'nid': nid,'lid':sh.getString('lid').toString() });
      var jsondata = json.decode(datas.body);
      String status = jsondata['status'];
      print(status);
      if (status == "ok") {
        String nid = jsondata['nid'];
        String message = jsondata['message'];
        sh.setString('nid',nid);
        callbackDispatcher(message);

      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print("Error ------------------- " + e.toString());
    }
  }
}

