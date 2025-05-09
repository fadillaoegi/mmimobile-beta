// To parse this JSON data, do
//
//     final highLight = highLightFromJson(jsonString);

import 'dart:convert';

HighLightOdm highLightFromJson(String str) => HighLightOdm.fromJson(json.decode(str));

String highLightToJson(HighLightOdm data) => json.encode(data.toJson());

class HighLightOdm {
  String? masterArticleId;
  String? masterArticleTitle;
  String? masterArticleDesc;
  String? masterArticleImg;
  String? masterArticlePublishDate;

  HighLightOdm({
    this.masterArticleId,
    this.masterArticleTitle,
    this.masterArticleDesc,
    this.masterArticleImg,
    this.masterArticlePublishDate,
  });

  factory HighLightOdm.fromJson(Map<String, dynamic> json) => HighLightOdm(
        masterArticleId: json["master_article_id"],
        masterArticleTitle: json["master_article_title"],
        masterArticleDesc: json["master_article_desc"],
        masterArticleImg: json["master_article_img"],
        masterArticlePublishDate: json["master_article_publish_date"],
      );

  Map<String, dynamic> toJson() => {
        "master_article_id": masterArticleId,
        "master_article_title": masterArticleTitle,
        "master_article_desc": masterArticleDesc,
        "master_article_img": masterArticleImg,
        "master_article_publish_date": masterArticlePublishDate,
      };
}
