// To parse this JSON data, do
//
//     final historySo = historySoFromJson(jsonString);

import 'dart:convert';

HistorySo historySoFromJson(String str) => HistorySo.fromJson(json.decode(str));

String historySoToJson(HistorySo data) => json.encode(data.toJson());

class HistorySo {
  DateTime? dateSo;
  String? nameSo;
  String? brandSo;
  String? typeSo;
  String? categorySo;
  String? totalSo;

  HistorySo({
    this.dateSo,
    this.nameSo,
    this.brandSo,
    this.typeSo,
    this.categorySo,
    this.totalSo,
  });

  factory HistorySo.fromJson(Map<String, dynamic> json) => HistorySo(
        dateSo: json["dateSo"] == null ? null : DateTime.parse(json["dateSo"]),
        nameSo: json["nameSo"],
        brandSo: json["brandSo"],
        typeSo: json["typeSo"],
        categorySo: json["categorySo"],
        totalSo: json["totalSo"],
      );

  Map<String, dynamic> toJson() => {
        "dateSo": dateSo?.toIso8601String(),
        "nameSo": nameSo,
        "brandSo": brandSo,
        "typeSo": typeSo,
        "categorySo": categorySo,
        "totalSo": totalSo,
      };
}
