// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:alquran/models/api_detailsurah.dart';
import 'package:alquran/models/api_surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/main.dart';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';

void main() async {
  Uri url = Uri.parse("https://quran-api-id.vercel.app/surahs");
  var response = await http.get(url);

  List data = (json.decode(response.body)
      as List<dynamic>); //Untuk memasukkan data ke dalam model

  //print(data[0]["number"]);

  Surah surahAlFatihah = Surah.fromJson(data[0]);

  /*print(surahAlFatihah.audio);
  print('=============');
  print(surahAlFatihah.description);
  print('=============');
  print(surahAlFatihah.name);
  print('=============');
  print(surahAlFatihah.number);
  print('=============');
  prints(surahAlFatihah.numberOfAyahs);
  print('=============');
  print(surahAlFatihah.revelation);
  print('=============');
  print(surahAlFatihah.translation);
  print('=============');
  */
  Uri urlAlFatihah = Uri.parse(
      "https://quran-api-id.vercel.app/surahs/${surahAlFatihah.number}");
  var responseAlFatihah = await http.get(urlAlFatihah);

  Map<String, dynamic> dataAlFatihah =
      (json.decode(responseAlFatihah.body) as Map<String, dynamic>);

  //print(responseAlFatihah.body);

  DetailSurah alFatihah = DetailSurah.fromJson(dataAlFatihah);

  print(surahAlFatihah.description);
}
