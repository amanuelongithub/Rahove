import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahove/provider/profile_provider.dart';
import 'package:rahove/screen/home_screen.dart';
import 'package:rahove/screen/login_screen.dart';
import 'package:rahove/screen/profile.dart';
import 'package:rahove/utils/colors.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 4, vsync: this);
  // int _selectedPage = 0;
  // void _changPage(int pagNum) {
  //   setState(() {
  //     _selectedPage = pagNum;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  void getTap(bool isTap) {
    if (isTap) {
      _tabController.animateTo((_tabController.index + 3) % 4);
    }
  }

  @override
  Widget build(BuildContext context) {
    // _tabController = TabController(length: 4, vsync: this);
    bool isTap = Provider.of<ProfileProvider>(context).isTap;
    getTap(isTap);

    return Material(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(),
                  Container(),
                  Container(),
                  Profile(),
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 236, 236),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: TabBar(
                controller: _tabController,
                isScrollable: false,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicator: CircleTabIndecator(color: maincolor, radius: 4),
                tabs: [
                  Tab(
                    child: TabButton(
                      icon: Icons.home,
                      pagenumber: 0,
                    ),
                  ),
                  Tab(
                    child: TabButton(
                      icon: Icons.stacked_line_chart,
                      pagenumber: 1,
                    ),
                  ),
                  Tab(
                    child: TabButton(
                      icon: FontAwesomeIcons.file,
                      pagenumber: 2,
                    ),
                  ),
                  Tab(
                    child: TabButton(
                      icon: FontAwesomeIcons.user,
                      pagenumber: 3,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final IconData icon;
  final int selectedPage;
  final int pagenumber;
  // final VoidCallback onPressed;

  TabButton({
    required this.icon,
    this.selectedPage = 0,
    this.pagenumber = 0,
    // required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          size: 20,
          color: seccolor,
        ),
      ),
    );
  }
}

class CircleTabIndecator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndecator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint paint;
    paint = Paint()..color = color;
    paint = paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
