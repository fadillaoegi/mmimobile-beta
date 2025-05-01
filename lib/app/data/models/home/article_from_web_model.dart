import 'dart:convert';

List<ArticleWeb> articleWebFromJson(String str) =>
    List<ArticleWeb>.from(json.decode(str).map((x) => ArticleWeb.fromJson(x)));

String articleWebToJson(List<ArticleWeb> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleWeb {
  String? id;
  DateTime? date;
  String? slug;
  String? status;
  String? type;
  String? link;
  RenderedText? title;
  RenderedText? content;
  RenderedText? excerpt;

  ArticleWeb({
    this.id,
    this.date,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
  });

  factory ArticleWeb.fromJson(Map<String, dynamic> json) => ArticleWeb(
        id: json["id"].toString(),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title:
            json["title"] == null ? null : RenderedText.fromJson(json["title"]),
        content: json["content"] == null
            ? null
            : RenderedText.fromJson(json["content"]),
        excerpt: json["excerpt"] == null
            ? null
            : RenderedText.fromJson(json["excerpt"]),
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
        "excerpt": excerpt?.toJson(),
      };
}

class RenderedText {
  String? rendered;
  bool? protected;

  RenderedText({this.rendered, this.protected});

  factory RenderedText.fromJson(Map<String, dynamic> json) => RenderedText(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}
