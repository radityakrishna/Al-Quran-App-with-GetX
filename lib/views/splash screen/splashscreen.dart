import 'package:alquran/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        SizedBox(height: 46),
        Center(
          child: Text("Quran App",
              style: TextStyle(
                  color: splashScreenPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 16),
        Center(
            child: Text(
          "Learn Quran and",
          style: TextStyle(fontSize: 18, color: customGrey),
        )),
        Center(
            child: Text(
          "Recite once everyday",
          style: TextStyle(fontSize: 18, color: customGrey),
        )),
        SizedBox(height: 30),
        Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 425,
                width: 314,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash-image.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 390),
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => HomeScreen()),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        minimumSize: Size(185, 60),
                        backgroundColor: Color(0xfff9b091),
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    child: Text(
                      "Get Started",
                    )),
              ),
            )
          ],
        )
      ],
    )));
  }
}
