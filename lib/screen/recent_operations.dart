import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rahove/model/user.dart';
import 'package:rahove/utils/colors.dart';

class RecentOperations extends StatefulWidget {
  const RecentOperations({super.key});

  @override
  State<RecentOperations> createState() => _RecentOperationsState();
}

class _RecentOperationsState extends State<RecentOperations> {
  List<User> users = getUser();
  static List<User> getUser() {
    const data = [
      {
        "postdate": "Today",
        "profile": "assets/img/user1.jpg",
        "username": "Joahnnes Milik",
        "phonenumber": "+251975421575",
        "cost": "501.0",
        "plus": "green",
      },
      {
        "postdate": "Today",
        "profile": "assets/img/user2.jpg",
        "username": "James MiMichaellik",
        "phonenumber": "+251911741520",
        "cost": "880.0",
        "plus": "red",
      },
      {
        "postdate": "Yesterday",
        "profile": "assets/img/user3.jpg",
        "username": "Thomas Charles",
        "phonenumber": "+25191001521",
        "cost": "600.0",
        "plus": "red",
      },
      {
        "postdate": "Yesterday",
        "profile": "assets/img/user4.jpg",
        "username": "Betty Mark",
        "phonenumber": "+251912358457",
        "cost": "100.0",
        "plus": "green",
      },
      {
        "postdate": "Yesterday",
        "profile": "assets/img/user5.jpg",
        "username": "Emily Donald",
        "phonenumber": "+251911315552",
        "cost": "1010.0",
        "plus": "green",
      },
      {
        "postdate": "Yesterday",
        "profile": "assets/img/user6.jpg",
        "username": "Melissa Kevin",
        "phonenumber": "+251912457854",
        "cost": "700.0",
        "plus": "red",
      },
    ];
    final filterdata =
        data.where((element) => element['postdate']!.contains('Today'));
    return data.map<User>(User.fromJson).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: UnconstrainedBox(
              child: Container(
                width: 80,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(203, 144, 144, 144),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Today",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.only(bottom: 5),
              itemCount: users.length,
              itemBuilder: (_, index) {
                final user = users[index];
                if (user.postdate == "Today")
                  return buildCard(user);
                else
                  return Container();
              }),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: UnconstrainedBox(
              child: Container(
                width: 80,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(203, 144, 144, 144),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Yesterday",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemCount: users.length,
              itemBuilder: (_, index) {
                final user = users[index];
                if (user.postdate == "Yesterday")
                  return buildCard(user);
                else
                  return Container();
              }),
        ],
      ),
    );
  }

  Widget buildCard(User user) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromARGB(202, 236, 236, 236),
        border: Border(
          bottom:
              BorderSide(width: 1.5, color: Color.fromARGB(255, 146, 146, 146)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(
                      user.profile,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.username,
                            style:
                                TextStyle(fontSize: 19, color: Colors.black)),
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            user.phonenumber,
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ),
                      ]),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "+ ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: user.plus == 'green' ? green : red)),
                  TextSpan(
                      text: user.cost,
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  TextSpan(
                      text: "ETB",
                      style: TextStyle(
                          color: Color.fromARGB(255, 111, 36, 192),
                          fontSize: 14)),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "04.08",
                      style:
                          TextStyle(color: Color.fromARGB(255, 135, 135, 135))),
                  TextSpan(
                      text: " AM",
                      style: TextStyle(
                          color: Color.fromARGB(255, 180, 180, 180),
                          fontSize: 13)),
                ])),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
