import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
