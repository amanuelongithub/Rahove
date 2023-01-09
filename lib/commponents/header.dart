import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rahove/commponents/bottom_nav.dart';
import 'package:rahove/commponents/box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahove/screen/profile.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  offset: Offset(1, 1),
                  color: Color.fromARGB(54, 104, 104, 104))
            ]),
            child: InkWell(
              onTap: () {
                Provider.of<ProfileProvider>(context, listen: false)
                    .goToProfile();
           
              },
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage("assets/img/avatar3.jpg")),
              ),
            ),
          ),
          Text(
            "Home",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 25, color: Colors.white),
          ),
          Box(icon: FontAwesomeIcons.dice, size: 20)
        ],
      ),
    );
  }
}
