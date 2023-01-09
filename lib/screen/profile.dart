import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahove/commponents/custom_button.dart';
import 'package:rahove/main.dart';
import 'package:provider/provider.dart';
import 'package:rahove/provider/gesture_detector.dart';
import '../utils/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    bool isenebled = Provider.of<GestureDetectorProvider>(context).isenebled;
    return Scaffold(
      body: Column(
        children: [
          AnimatedCrossFade(
              firstChild: buildProfile1(),
              secondChild: buildProfile2(),
              crossFadeState: isenebled == true
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                  flex: 5,
                )
              ],
            ),
          ),
          Expanded(
              child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.atEdge) {
                if (notification.metrics.pixels == 0) {
                  Provider.of<GestureDetectorProvider>(context, listen: false)
                      .changeProfile();
                }
              }
              return true;
            },
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                SettingList(Icons.notifications, "Notification", "2"),
                SizedBox(
                  height: 15,
                ),
                SettingList(Icons.report, "Report", "2"),
                SizedBox(
                  height: 15,
                ),
                SettingList(Icons.email, "Email", "2"),
                SizedBox(
                  height: 15,
                ),
                SettingList(Icons.security, "Security and policy", "4"),
                SizedBox(
                  height: 15,
                ),
                SettingList(Icons.email, "Terms and Service", "4"),
                SizedBox(
                  height: 15,
                ),
                SettingList(Icons.accessibility, "Accessibility", "4"),
                SizedBox(
                  height: 15,
                ),
                SettingList(Icons.logout, "Logout", "3"),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget SettingList(
    IconData leading,
    String title,
    String trailing,
  ) {
    return Container(
      color: Color.fromARGB(201, 231, 231, 231),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          highlightColor: Color.fromARGB(47, 170, 135, 245),
          splashColor: Color.fromARGB(61, 231, 231, 231),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                leading,
                color: maincolor,
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(
                trailing,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfile1() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.85,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/img/avatar3.jpg",
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 60, left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                border: Border.all(width: 1, color: Colors.white30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Liya Dereje",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "liyaderege@gmail.com",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                ),
                CustomButton(
                  text: "Edit Profile",
                  min: true,
                  press: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildProfile2() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-0.95, 0.0),
          stops: [0.0, 1.0],
          colors: [
            maincolor,
            Color.fromARGB(231, 123, 167, 245),
          ],
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 52,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/img/avatar3.jpg",
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "Liya Dereje",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      "liyaderege@gmail.com",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
/*
 */
