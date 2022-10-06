import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/core.dart';
import 'dart:convert';

class BigContainer extends StatefulWidget {
  const BigContainer({super.key});

  @override
  State<BigContainer> createState() => _BigContainerState();
}

class _BigContainerState extends State<BigContainer> {
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 265,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Frame 33.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(18)),
      ),
      Center(
        child: Column(
          children: [
            SizedBox(height: 28),
            Text("Surah ${surah.name}",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            SizedBox(height: 8),
            Text("(${surah.translation})",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            SizedBox(height: 16),
            Container(
                height: 2, width: 200, color: Colors.white.withOpacity(0.35)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${surah.revelation?.toUpperCase()}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                SizedBox(width: 4),
                Icon(
                  Icons.circle,
                  color: Colors.white.withOpacity(0.35),
                  size: 8,
                ),
                SizedBox(width: 4),
                Text("${surah.numberOfAyahs} Ayat",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ],
            ),
            SizedBox(height: 28),
            Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bismillah.png"),
                        fit: BoxFit.fitWidth)))
          ],
        ),
      )
    ]);
  }
}
