// To parse this JSON data, do
//
//     final historySo = historySoFromJson(jsonString);

import 'dart:convert';

HistorySo historySoFromJson(String str) => HistorySo.fromJson(json.decode(str));

String historySoToJson(HistorySo data) => json.encode(data.toJson());

class HistorySo {
  DateTime? date;
  String? nameSo;
  String? totalSo;

  HistorySo({
    this.date,
    this.nameSo,
    this.totalSo,
  });

  factory HistorySo.fromJson(Map<String, dynamic> json) => HistorySo(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        nameSo: json["nameSo"],
        totalSo: json["totalSo"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "nameSo": nameSo,
        "totalSo": totalSo,
      };
}
