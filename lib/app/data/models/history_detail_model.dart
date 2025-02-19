// To parse this JSON data, do
//
//     final historyDetail = historyDetailFromJson(jsonString);

import 'dart:convert';

HistoryDetail historyDetailFromJson(String str) =>
    HistoryDetail.fromJson(json.decode(str));

String historyDetailToJson(HistoryDetail data) => json.encode(data.toJson());

class HistoryDetail {
  DateTime? dateSo;
  String? nameSo;
  String? productName;
  String? categorySo;
  String? typeSo;
  String? productPrice;
  String? productQty;
  String? productTotal;
  String? nameCustomer;
  String? brandName;

  HistoryDetail({
    this.dateSo,
    this.nameSo,
    this.productName,
    this.categorySo,
    this.typeSo,
    this.productPrice,
    this.productQty,
    this.productTotal,
    this.nameCustomer,
    this.brandName,
  });

  factory HistoryDetail.fromJson(Map<String, dynamic> json) => HistoryDetail(
        dateSo: json["dateSo"] == null ? null : DateTime.parse(json["dateSo"]),
        nameSo: json["nameSo"],
        productName: json["productName"],
        categorySo: json["categorySo"],
        typeSo: json["typeSo"],
        productPrice: json["productPrice"],
        productQty: json["productQty"],
        productTotal: json["productTotal"],
        nameCustomer: json["nameCustomer"],
        brandName: json["brandName"],
      );

  Map<String, dynamic> toJson() => {
        "dateSo": dateSo?.toIso8601String(),
        "nameSo": nameSo,
        "productName": productName,
        "categorySo": categorySo,
        "typeSo": typeSo,
        "productPrice": productPrice,
        "productQty": productQty,
        "productTotal": productTotal,
        "nameCustomer": nameCustomer,
        "brandName": brandName,
      };
}
