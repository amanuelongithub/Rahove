import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rahove/commponents/box.dart';
import 'package:rahove/commponents/header.dart';
import 'package:rahove/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';
import "package:fl_chart/fl_chart.dart";

import '../commponents/LineTitles.dart';
import '../model/company.dart';
import 'recent_operations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Company> companys = getCompany();
  static List<Company> getCompany() {
    const data = [
      {
        "leading": "assets/img/feres.jpg",
        "title": "Feres Transport",
        "subtitle": "https://www.feres.com",
      },
      {
        "leading": "assets/img/chappa.jpg",
        "title": "Chappa",
        "subtitle": "https://www.chappa.com",
      },
    ];

    return data.map<Company>(Company.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0),
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
            height: MediaQuery.of(context).size.height / 1.8,
            child: Column(
              children: [
                Header(),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Soliana",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Let's check our status",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  // width: 370,
                  height: 230,
                  child: PageView.builder(
                    itemCount: companys.length,
                    itemBuilder: (context, int index) {
                      final company = companys[index];
                      return Container(
                        width: 300,
                        height: 220,
                        margin: EdgeInsets.only(left: 30, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(15, 15),
                                  color: Color.fromARGB(54, 104, 104, 104))
                            ],
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              AssetImage(company.leading)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(company.title,
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.black)),
                                            Text(
                                              company.subtitle,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey),
                                            ),
                                          ]),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    "assets/img/loading.svg",
                                    height: 30,
                                    color: Color.fromARGB(186, 177, 177, 177),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            buildLineChart()
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent operations",
                    style: TextStyle(
                        color: maincolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RecentOperations()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLineChart() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: LineChart(LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
                border: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 220, 220, 220)),
                    top:
                        BorderSide(color: Color.fromARGB(255, 220, 220, 220)))),
            lineBarsData: [
              LineChartBarData(
                  spots: [
                    FlSpot(0, 1),
                    FlSpot(2, 1),
                    FlSpot(3, 1),
                    FlSpot(4, 3),
                    FlSpot(5, 4),
                    FlSpot(6.8, 1.5),
                    FlSpot(8, 4),
                    FlSpot(9.5, 2),
                    FlSpot(11, 1),
                  ],
                  color: Color.fromARGB(255, 22, 178, 27),
                  isCurved: false,
                  dotData: FlDotData(
                    show: false,
                  ))
            ])),
      ),
    );
  }
}
