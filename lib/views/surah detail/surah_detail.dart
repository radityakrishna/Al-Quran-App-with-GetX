import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran/core.dart';
import 'dart:convert';

class SurahDetail extends StatefulWidget {
  const SurahDetail({super.key});

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://quran-api-id.vercel.app/surahs/$id");
    var response = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(response.body) as Map<String, dynamic>);

    return DetailSurah.fromJson(data);
  }

  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back),
              color: Colors.grey),
          title: Text("Surah ${surah.name}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: splashScreenPurple)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.grey),
            )
          ]),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: BigContainer(),
        ),
        Expanded(
            child: FutureBuilder<DetailSurah>(
                future: getDetailSurah(surah.number.toString()),
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
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.ayahs?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (snapshot.data?.ayahs?.length == 0) {
                        return Center(child: Text("Data kosong"));
                      }
                      Ayah? ayahs = snapshot.data?.ayahs?[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xfff9f5fd),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(children: [
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
                                        child:
                                            Center(child: Text("${index + 1}")),
                                      )
                                    ]),
                                    Row(
                                      children: [
                                        IconButton(
                                            color: ayahPurple,
                                            onPressed: () {},
                                            icon: Icon(Icons.share_outlined)),
                                        IconButton(
                                            color: ayahPurple,
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.play_arrow_outlined)),
                                        IconButton(
                                            color: ayahPurple,
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.bookmark_border_outlined))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 16),
                            child: Text("${ayahs!.arab}",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Text("${ayahs.translation}",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                          ),
                          SizedBox(height: 20)
                        ],
                      );
                    },
                  );
                }))
      ]),
    );
  }
}
