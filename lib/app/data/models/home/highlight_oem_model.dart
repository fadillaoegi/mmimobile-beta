import 'dart:convert';

HighLightOem highLightFromJson(String str) =>
    HighLightOem.fromJson(json.decode(str));

String highLightToJson(HighLightOem data) => json.encode(data.toJson());

class HighLightOem {
  String? masterArticleId;
  String? masterArticleTitle;
  String? masterArticleDesc;
  String? masterArticleImg;
  String? masterArticlePublishDate;

  HighLightOem({
    this.masterArticleId,
    this.masterArticleTitle,
    this.masterArticleDesc,
    this.masterArticleImg,
    this.masterArticlePublishDate,
  });

  factory HighLightOem.fromJson(Map<String, dynamic> json) => HighLightOem(
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
