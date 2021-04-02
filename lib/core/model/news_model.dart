
// class NewsModel {
//   Pagination pagination;
//   List<Data> data;

//   NewsModel({this.pagination, this.data});

//   NewsModel.fromJson(Map<String, dynamic> json) {
//     if(json["pagination"] is Map)
//       this.pagination = json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]);
//     if(json["data"] is List)
//       this.data = json["data"]==null?[]:(json["data"] as List).map((e)=>Data.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if(this.pagination != null)
//       data["pagination"] = this.pagination.toJson();
//     if(this.data != null)
//       data["data"] = this.data.map((e)=>e.toJson()).toList();
//     return data;
//   }
// }

// class Data {
//   String author;
//   String title;
//   String description;
//   String url;
//   String source;
//   String image;
//   String category;
//   String language;
//   String country;
//   String publishedAt;

//   Data({this.author, this.title, this.description, this.url, this.source, this.image, this.category, this.language, this.country, this.publishedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     if(json["author"] is String)
//       this.author = json["author"];
//     if(json["title"] is String)
//       this.title = json["title"];
//     if(json["description"] is String)
//       this.description = json["description"];
//     if(json["url"] is String)
//       this.url = json["url"];
//     if(json["source"] is String)
//       this.source = json["source"];
//     if(json["image"] is String)
//       this.image = json["image"];
//     if(json["category"] is String)
//       this.category = json["category"];
//     if(json["language"] is String)
//       this.language = json["language"];
//     if(json["country"] is String)
//       this.country = json["country"];
//     if(json["published_at"] is String)
//       this.publishedAt = json["published_at"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["author"] = this.author;
//     data["title"] = this.title;
//     data["description"] = this.description;
//     data["url"] = this.url;
//     data["source"] = this.source;
//     data["image"] = this.image;
//     data["category"] = this.category;
//     data["language"] = this.language;
//     data["country"] = this.country;
//     data["published_at"] = this.publishedAt;
//     return data;
//   }
// }

// class Pagination {
//   int limit;
//   int offset;
//   int count;
//   int total;

//   Pagination({this.limit, this.offset, this.count, this.total});

//   Pagination.fromJson(Map<String, dynamic> json) {
//     if(json["limit"] is int)
//       this.limit = json["limit"];
//     if(json["offset"] is int)
//       this.offset = json["offset"];
//     if(json["count"] is int)
//       this.count = json["count"];
//     if(json["total"] is int)
//       this.total = json["total"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["limit"] = this.limit;
//     data["offset"] = this.offset;
//     data["count"] = this.count;
//     data["total"] = this.total;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NewsModel welcomeFromJson(String str) => NewsModel.fromJson(json.decode(str));

String welcomeToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
        this.pagination,
        this.data,
    });

    Pagination pagination;
    List<Data> data;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    Data({
        this.author,
        this.title,
        this.description,
        this.url,
        this.source,
        this.image,
        this.category,
        this.language,
        this.country,
        this.publishedAt,
    });

    String author;
    String title;
    String description;
    String url;
    String source;
    String image;
    Category category;
    Language language;
    Country country;
    DateTime publishedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        source: json["source"],
        image: json["image"] == null ? null : json["image"],
        category: categoryValues.map[json["category"]],
        language: languageValues.map[json["language"]],
        country: countryValues.map[json["country"]],
        publishedAt: DateTime.parse(json["published_at"]),
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "source": source,
        "image": image == null ? null : image,
        "category": categoryValues.reverse[category],
        "language": languageValues.reverse[language],
        "country": countryValues.reverse[country],
        "published_at": publishedAt.toIso8601String(),
    };
}

enum Category { GENERAL }

final categoryValues = EnumValues({
    "general": Category.GENERAL
});

enum Country { NG }

final countryValues = EnumValues({
    "ng": Country.NG
});

enum Language { EN }

final languageValues = EnumValues({
    "en": Language.EN
});

enum Source { INFORMATION_NIGERIA, TRIBUNE, LEADERSHIP }

final sourceValues = EnumValues({
    "Information Nigeria": Source.INFORMATION_NIGERIA,
    "Leadership": Source.LEADERSHIP,
    "tribune": Source.TRIBUNE
});

class Pagination {
    Pagination({
        this.limit,
        this.offset,
        this.count,
        this.total,
    });

    int limit;
    int offset;
    int count;
    int total;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
