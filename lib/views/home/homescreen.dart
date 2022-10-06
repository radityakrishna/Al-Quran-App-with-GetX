import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu), color: Colors.grey),
        title: Text("Quran App",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: splashScreenPurple)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.search), color: Colors.grey),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24),
            child: Text("Assalaamualaikum",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff8789a3))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text("Abdurrahman Ar-Radidy",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xff240F4F))),
          ),
          Stack(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  height: 131,
                  width: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/banner-home.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 45),
              child: Row(
                children: [
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/icons/cib-readme 1.png"),
                              fit: BoxFit.contain))),
                  SizedBox(width: 8),
                  Text("Last Read",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 90),
              child: Text("Al-Fatihah",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 115),
              child: Text("Ayah No: 1",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white)),
            ),
          ]),
          SizedBox(height: 18),
          Center(child: HomeTabBar()),

          /*ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        height: 24,
                        width: 24,
                        child: Stack(
                          children: <Widget>[
                            Image.asset("assets/icons/muslim1-1.png"),
                            Center(
                              child: Text("${index + 1}"),
                            )
                          ],
                        ),
                      ),
                      subtitle: Text("xxx Ayat - Makiyah"),
                      trailing: Text("Nama Surah in Arabic"),
                    )),
          )*/
        ],
      ),
    );
  }
}
