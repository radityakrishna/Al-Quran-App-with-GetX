import 'package:flutter/material.dart';
import 'package:alquran/core.dart';
import 'package:get/get.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 350,
        child: Column(
          children: [
            TabBar(
                labelColor: splashScreenPurple,
                unselectedLabelColor: customGrey,
                indicatorColor: splashScreenPurple,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                controller: _tabController,
                tabs: [
                  Tab(text: "Surah"),
                  Tab(text: "Juz"),
                  Tab(text: "Page"),
                  Tab(text: "Hijab")
                ]),
            SizedBox(height: 12),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: TabBarView(
                  controller: _tabController,
                  children: [ListSurah(), PageTwo(), PageThree(), PageFour()]),
            )
          ],
        ),
      ),
    );
  }
}
