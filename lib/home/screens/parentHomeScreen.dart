import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/HomeScreenController.dart';
import '../controllers/HomeScreenController.dart';
import '../utils/AppAssets.dart';
import '../utils/AppSpaces.dart';
import '../widgets/buttons.dart';

void main(){
  runApp(ParentHomeScreen());
}
class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

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
                          image: "assets/student.png",
                          text: 'Students',
                          isSelected: controller.index == 0,
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyViewStudent()));
                          },
                        ),
                        AppSpaces.horizontal20,
                        HomeButton(
                          image: "assets/notification.png",
                          text: 'Notification',
                          isSelected: controller.index == 2,
                          onTap: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyNotification(),
                            //   ),
                            // );
                          },
                        ),
                      ]),
                    ),
                    AppSpaces.vertical20,
                    Expanded(
                      child: Row(children: [
                        HomeButton(
                          image: "assets/authority.png",
                          text: 'Authority',
                          isSelected: controller.index == 3,
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyViewAuthority(),
                            //   ),
                            // );
                          },
                        ),
                        AppSpaces.horizontal20,
                        HomeButton(
                          image: "assets/feedback.png",
                          text: 'Feedback',
                          isSelected: controller.index == 2,
                          onTap: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyParentSendFeedback(title: ""),
                            //   ),
                            // );
                          },
                        ),
                      ]),
                    ),
                    AppSpaces.vertical20,
                    Expanded(
                      child: Row(children: [
                        HomeButton(
                          image: "assets/complaint.png",
                          text: 'Complaints',
                          isSelected: controller.index == 2,
                          onTap: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyViewReplyPage(title: ""),
                            //   ),
                            // );
                          },
                        ),
                        AppSpaces.horizontal20,
                        HomeButton(
                          image: "assets/password.png",
                          text: 'Password',
                          isSelected: controller.index == 3,
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyPparentChangePassword(title: ""),
                            //   ),
                            // );
                          },
                        ),
                      ]),
                    ),
                    AppSpaces.vertical20,
                    Expanded(
                      child: Row(children: [
                        AppSpaces.horizontal20,
                      ]),
                    ), AppSpaces.vertical20,
                    Expanded(
                      child: Row(children: [
                        HomeButton(
                          image: "assets/logout.png",
                          text: 'Logout',
                          isSelected: controller.index == 2,
                          onTap: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MyLoginPage(title: ""),
                            //   ),
                            // );
                          },
                        ),
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
