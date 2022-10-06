// To parse this JSON data, do
//
//     final detailSurah = detailSurahFromJson(jsonString);

import 'dart:convert';

DetailSurah detailSurahFromJson(String str) =>
    DetailSurah.fromJson(json.decode(str));

String detailSurahToJson(DetailSurah data) => json.encode(data.toJson());

class DetailSurah {
  DetailSurah({
    this.number,
    this.numberOfAyahs,
    this.name,
    this.translation,
    this.revelation,
    this.description,
    this.audio,
    this.bismillah,
    this.ayahs,
  });

  int? number;
  int? numberOfAyahs;
  String? name;
  String? translation;
  String? revelation;
  String? description;
  String? audio;
  Bismillah? bismillah;
  List<Ayah>? ayahs;

  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        number: json["number"],
        numberOfAyahs: json["numberOfAyahs"],
        name: json["name"],
        translation: json["translation"],
        revelation: json["revelation"],
        description: json["description"],
        audio: json["audio"],
        bismillah: Bismillah.fromJson(json["bismillah"]),
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "numberOfAyahs": numberOfAyahs,
        "name": name,
        "translation": translation,
        "revelation": revelation,
        "description": description,
        "audio": audio,
        "bismillah": bismillah?.toJson(),
        "ayahs": ayahs == null
            ? null
            : List<dynamic>.from(ayahs!.map((x) => x.toJson())),
      };
}

class Ayah {
  Ayah({
    this.number,
    this.arab,
    this.translation,
    this.audio,
    this.image,
    this.tafsir,
    this.meta,
  });

  Number? number;
  String? arab;
  String? translation;
  Audio? audio;
  Image? image;
  Tafsir? tafsir;
  Meta? meta;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: Number.fromJson(json["number"]),
        arab: json["arab"],
        translation: json["translation"],
        audio: Audio.fromJson(json["audio"]),
        image: Image.fromJson(json["image"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "arab": arab,
        "translation": translation,
        "audio": audio?.toJson(),
        "image": image?.toJson(),
        "tafsir": tafsir?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Audio {
  Audio({
    this.alafasy,
    this.ahmedajamy,
    this.husarymujawwad,
    this.minshawi,
    this.muhammadayyoub,
    this.muhammadjibreel,
  });

  String? alafasy;
  String? ahmedajamy;
  String? husarymujawwad;
  String? minshawi;
  String? muhammadayyoub;
  String? muhammadjibreel;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        alafasy: json["alafasy"],
        ahmedajamy: json["ahmedajamy"],
        husarymujawwad: json["husarymujawwad"],
        minshawi: json["minshawi"],
        muhammadayyoub: json["muhammadayyoub"],
        muhammadjibreel: json["muhammadjibreel"],
      );

  Map<String, dynamic> toJson() => {
        "alafasy": alafasy,
        "ahmedajamy": ahmedajamy,
        "husarymujawwad": husarymujawwad,
        "minshawi": minshawi,
        "muhammadayyoub": muhammadayyoub,
        "muhammadjibreel": muhammadjibreel,
      };
}

class Image {
  Image({
    this.primary,
    this.secondary,
  });

  String? primary;
  String? secondary;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        primary: json["primary"],
        secondary: json["secondary"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
      };
}

class Meta {
  Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  int? juz;
  int? page;
  int? manzil;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: Sajda.fromJson(json["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda?.toJson(),
      };
}

class Sajda {
  Sajda({
    this.recommended,
    this.obligatory,
  });

  bool? recommended;
  bool? obligatory;

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };
}

class Number {
  Number({
    this.inQuran,
    this.inSurah,
  });

  int? inQuran;
  int? inSurah;

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };
}

class Tafsir {
  Tafsir({
    this.kemenag,
    this.quraish,
    this.jalalayn,
  });

  Kemenag? kemenag;
  String? quraish;
  String? jalalayn;

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        kemenag: Kemenag.fromJson(json["kemenag"]),
        quraish: json["quraish"],
        jalalayn: json["jalalayn"],
      );

  Map<String, dynamic> toJson() => {
        "kemenag": kemenag?.toJson(),
        "quraish": quraish,
        "jalalayn": jalalayn,
      };
}

class Kemenag {
  Kemenag({
    this.short,
    this.long,
  });

  String? short;
  String? long;

  factory Kemenag.fromJson(Map<String, dynamic> json) => Kemenag(
        short: json["short"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };
}

class Bismillah {
  Bismillah({
    this.arab,
    this.translation,
    this.audio,
  });

  String? arab;
  String? translation;
  Audio? audio;

  factory Bismillah.fromJson(Map<String, dynamic> json) => Bismillah(
        arab: json["arab"],
        translation: json["translation"],
        audio: Audio.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "translation": translation,
        "audio": audio?.toJson(),
      };
}
