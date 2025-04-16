// To parse this JSON data, do
//
//     final articleFromWeb = articleFromWebFromJson(jsonString);

import 'dart:convert';

ArticleFromWeb articleFromWebFromJson(String str) =>
    ArticleFromWeb.fromJson(json.decode(str));

String articleFromWebToJson(ArticleFromWeb data) => json.encode(data.toJson());

class ArticleFromWeb {
  String? id;
  DateTime? date;
  String? slug;
  String? status;
  String? type;
  String? link;
  Content? title;
  Content? content;

  ArticleFromWeb({
    this.id,
    this.date,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
  });

  factory ArticleFromWeb.fromJson(Map<String, dynamic> json) => ArticleFromWeb(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: json["title"] == null ? null : Content.fromJson(json["title"]),
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title?.toJson(),
        "content": content?.toJson(),
      };
}

class Content {
  String? rendered;

  Content({
    this.rendered,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}
