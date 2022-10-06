import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/core.dart';
import 'dart:convert';

class ListSurah extends StatefulWidget {
  const ListSurah({super.key});

  @override
  State<ListSurah> createState() => _ListSurahState();
}

class _ListSurahState extends State<ListSurah> {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://quran-api-id.vercel.app/surahs");
    var response = await http.get(url);

    List? data = (json.decode(response.body) as List<dynamic>);

    if (data == null || data.isEmpty) {
      return [];
    } else
      return data.map((e) => Surah.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Surah>>(
            future: getAllSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: ayahPurple,
                ));
              }
              if (!snapshot.hasData) {
                return Center(child: Text("Data kosong"));
              }
              return Scrollbar(
                thickness: 3,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Surah surah = snapshot.data![index];
                      return ListTile(
                        onTap: () =>
                            Get.to(() => SurahDetail(), arguments: surah),
                        leading: Stack(children: <Widget>[
                          Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/muslim1-1.png")))),
                          SizedBox(
                              height: 36,
                              width: 36,
                              child: Center(child: Text("${surah.number}"))),
                        ]),
                        title: Text("${surah.name}"),
                        subtitle: Text(
                          "${surah.numberOfAyahs} Ayat",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("${surah.revelation}"),
                      );
                    }),
              );
            }));
  }
}
