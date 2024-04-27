import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/HomeScreenController.dart';
import '../utils/AppAssets.dart';
import '../utils/AppSpaces.dart';
import '../widgets/buttons.dart';

void main(){
  runApp(HomeScreen());
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                // actions: [
                //   IconButton(onPressed: (){}, icon: Icon(Icons.home))
                // ],
                centerTitle: true,
                backgroundColor: Colors.blueGrey,
                title: Text("Home"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // TopSelectButton(),
                    AppSpaces.vertical10,
                    Expanded(
                      child: Row(children: [
                        HomeButton(
                          image: "assets/profile.png",
                          text: 'Profile',
                          isSelected: controller.index == 0,
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyViewProfilePage(title: "Profile")));
                          },
                        ),
                        AppSpaces.horizontal20,
                        HomeButton(
                          image: "assets/attendance.png",
                          text: 'My Attendance',
                          isSelected: controller.index == 1,
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyViewAttendance()));
                          },
                        ),
                      ]),
                    ),
                    AppSpaces.vertical20,
                    Expanded(
                      child: Row(children: [
                        HomeButton(
                          image: "assets/feedback.png",
                          text: 'Send Feedback',
                          isSelected: controller.index == 2,
                          onTap: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MySendFeedback(title: ""),
                            //   ),
                            // );
                          },
                        ),
                        AppSpaces.horizontal20,
                        HomeButton(
                          image: "assets/password.png",
                          text: 'Change Password',
                          isSelected: controller.index == 3,
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyChangePassword(title: ""),
                            //   ),
                            // );
                          },
                        ),
                      ]),
                    ),
                    AppSpaces.vertical20,
                    Expanded(
                      child: Row(children: [
                        Container(
                          width: 150,
                          child: Column(
                            children: [
                              HomeButton(
                                image: "assets/logout.png",
                                text: 'Logout',
                                isSelected: controller.index == 4,
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLoginPage(title: "Login")));

                                },
                              ),
                            ],
                          ),
                        )


                      ]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
