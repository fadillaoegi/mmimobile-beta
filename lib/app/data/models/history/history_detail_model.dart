// To parse this JSON data, do
//
//     final historyDetail = historyDetailFromJson(jsonString);

import 'dart:convert';

HistoryDetail historyDetailFromJson(String str) =>
    HistoryDetail.fromJson(json.decode(str));

String historyDetailToJson(HistoryDetail data) => json.encode(data.toJson());

class HistoryDetail {
  String? soId;
  String? productName;
  String? productPrice;
  String? productQty;
  String? productTotal;

  HistoryDetail({
    this.soId,
    this.productName,
    this.productPrice,
    this.productQty,
    this.productTotal,
  });

  factory HistoryDetail.fromJson(Map<String, dynamic> json) => HistoryDetail(
        soId: json["soId"],
        productName: json["productName"],
        productPrice: json["productPrice"],
        productQty: json["productQty"],
        productTotal: json["productTotal"],
      );

  Map<String, dynamic> toJson() => {
        "soId": soId,
        "productName": productName,
        "productPrice": productPrice,
        "productQty": productQty,
        "productTotal": productTotal,
      };
}
