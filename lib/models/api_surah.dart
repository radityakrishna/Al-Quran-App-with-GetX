// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

// API : https://quran-api-id.vercel.app/surahs => untuk get seluruh surah

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  Surah({
    this.number,
    this.numberOfAyahs,
    this.name,
    this.translation,
    this.revelation,
    this.description,
    this.audio,
  });

  int? number;
  int? numberOfAyahs;
  String? name;
  String? translation;
  String? revelation;
  String? description;
  String? audio;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        numberOfAyahs: json["numberOfAyahs"],
        name: json["name"],
        translation: json["translation"],
        revelation: json["revelation"],
        description: json["description"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "name": name,
        "translation": translation,
        "revelation": revelation,
        "description": description,
        "audio": audio,
      };
}
