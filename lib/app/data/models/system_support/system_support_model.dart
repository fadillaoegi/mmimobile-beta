// To parse this JSON data, do
//
//     final systemSupport = systemSupportFromJson(jsonString);

import 'dart:convert';

SystemSupport systemSupportFromJson(String str) =>
    SystemSupport.fromJson(json.decode(str));

String systemSupportToJson(SystemSupport data) => json.encode(data.toJson());

class SystemSupport {
  String? masterSupportId;
  String? masterSupportTitle;
  String? masterSupportDesc;
  String? masterSupportImg;
  String? masterSupportPublishDate;
  String? masterSupportDateCreate;
  String? masterSupportLink;

  SystemSupport({
    this.masterSupportId,
    this.masterSupportTitle,
    this.masterSupportDesc,
    this.masterSupportImg,
    this.masterSupportPublishDate,
    this.masterSupportDateCreate,
    this.masterSupportLink,
  });

  factory SystemSupport.fromJson(Map<String, dynamic> json) => SystemSupport(
        masterSupportId: json["master_support_id"],
        masterSupportTitle: json["master_support_title"],
        masterSupportDesc: json["master_support_desc"],
        masterSupportImg: json["master_support_img"],
        masterSupportPublishDate: json["master_support_publish_date"],
        masterSupportDateCreate: json["master_support_date_create"],
        masterSupportLink: json["master_support_link"],
      );

  Map<String, dynamic> toJson() => {
        "master_support_id": masterSupportId,
        "master_support_title": masterSupportTitle,
        "master_support_desc": masterSupportDesc,
        "master_support_img": masterSupportImg,
        "master_support_publish_date": masterSupportPublishDate,
        "master_support_date_create": masterSupportDateCreate,
        "master_support_link": masterSupportLink,
      };
}
