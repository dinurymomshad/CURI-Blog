import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.meta,
    this.yoastHead,
    this.links,
  });

  int id;
  String name;
  String url;
  String description;
  String link;
  String slug;
  Map<String, String> avatarUrls;
  List<dynamic> meta;
  String yoastHead;
  Links links;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        yoastHead: json["yoast_head"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": Map.from(avatarUrls).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "yoast_head": yoastHead,
        "_links": links.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}
