// To parse this JSON data, do
//
//     final datadaerahcovid = datadaerahcovidFromJson(jsonString);

import 'dart:convert';

List<Datadaerahcovid> datadaerahcovidFromJson(String str) =>
    List<Datadaerahcovid>.from(
        json.decode(str).map((x) => Datadaerahcovid.fromJson(x)));

String datadaerahcovidToJson(List<Datadaerahcovid> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Datadaerahcovid {
  Datadaerahcovid({
    required this.provinsi,
    required this.kasus,
    required this.dirawat,
    required this.sembuh,
    required this.meninggal,
  });

  String provinsi;
  int kasus;
  int dirawat;
  int sembuh;
  int meninggal;

  factory Datadaerahcovid.fromJson(Map<String, dynamic> json) =>
      Datadaerahcovid(
        provinsi: json["provinsi"],
        kasus: json["kasus"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "provinsi": provinsi,
        "kasus": kasus,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
      };
}
