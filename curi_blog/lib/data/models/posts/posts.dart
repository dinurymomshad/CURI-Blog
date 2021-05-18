import 'dart:convert';

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  PostsModel({
    this.data,
    this.pagination,
  });

  List<Posts> data;
  Pagination pagination;

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        data: List<Posts>.from(json["data"].map((x) => Posts.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Posts {
  Posts({
    this.id,
    this.title,
    this.author,
    this.category,
    this.excerpt,
    this.featuredImage,
    this.published,
  });

  int id;
  String title;
  String author;
  String category;
  String excerpt;
  String featuredImage;
  String published;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        category: json["category"],
        excerpt: json["excerpt"],
        featuredImage: json["featured_image"].toString(),
        published: json["published"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "category": category,
        "excerpt": excerpt,
        "featured_image": featuredImage,
        "published": published,
      };
}

class Pagination {
  Pagination({
    this.meta,
    this.links,
  });

  Meta meta;
  Links links;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        meta: Meta.fromJson(json["meta"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "links": links.toJson(),
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.next,
    this.prev,
  });

  String first;
  String last;
  String next;
  dynamic prev;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "next": next,
        "prev": prev,
      };
}

class Meta {
  Meta({
    this.totalPage,
    this.currentPage,
    this.perPage,
  });

  int totalPage;
  int currentPage;
  int perPage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalPage: json["total_page"],
        currentPage: json["current_page"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_page": totalPage,
        "current_page": currentPage,
        "per_page": perPage,
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
