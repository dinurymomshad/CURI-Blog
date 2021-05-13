// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.id,
    this.postAuthor,
    this.postDate,
    this.postDateGmt,
    this.postContent,
    this.postTitle,
    this.postExcerpt,
    this.postStatus,
    this.commentStatus,
    this.pingStatus,
    this.postPassword,
    this.postName,
    this.toPing,
    this.pinged,
    this.postModified,
    this.postModifiedGmt,
    this.postContentFiltered,
    this.postParent,
    this.guid,
    this.menuOrder,
    this.postType,
    this.postMimeType,
    this.commentCount,
    this.filter,
    this.ancestors,
    this.pageTemplate,
    this.postCategory,
    this.tagsInput,
    this.authorName,
  });

  int id;
  String postAuthor;
  String postDate;
  DateTime postDateGmt;
  String postContent;
  String postTitle;
  String postExcerpt;
  String postStatus;
  String commentStatus;
  String pingStatus;
  String postPassword;
  String postName;
  String toPing;
  String pinged;
  DateTime postModified;
  DateTime postModifiedGmt;
  String postContentFiltered;
  int postParent;
  String guid;
  int menuOrder;
  String postType;
  String postMimeType;
  String commentCount;
  String filter;
  List<dynamic> ancestors;
  String pageTemplate;
  List<int> postCategory;
  List<dynamic> tagsInput;
  String authorName;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["ID"],
    postAuthor: json["post_author"],
    postDate: json["post_date"].toString(),
    postDateGmt: DateTime.parse(json["post_date_gmt"]),
    postContent: json["post_content"],
    postTitle: json["post_title"],
    postExcerpt: json["post_excerpt"],
    postStatus: json["post_status"],
    commentStatus: json["comment_status"],
    pingStatus: json["ping_status"],
    postPassword: json["post_password"],
    postName: json["post_name"],
    toPing: json["to_ping"],
    pinged: json["pinged"],
    postModified: DateTime.parse(json["post_modified"]),
    postModifiedGmt: DateTime.parse(json["post_modified_gmt"]),
    postContentFiltered: json["post_content_filtered"],
    postParent: json["post_parent"],
    guid: json["guid"],
    menuOrder: json["menu_order"],
    postType: json["post_type"],
    postMimeType: json["post_mime_type"],
    commentCount: json["comment_count"],
    filter: json["filter"],
    ancestors: List<dynamic>.from(json["ancestors"].map((x) => x)),
    pageTemplate: json["page_template"],
    postCategory: List<int>.from(json["post_category"].map((x) => x)),
    tagsInput: List<dynamic>.from(json["tags_input"].map((x) => x)),
    authorName: json["author_name"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "post_author": postAuthor,
    "post_date": postDate,
    "post_date_gmt": postDateGmt.toIso8601String(),
    "post_content": postContent,
    "post_title": postTitle,
    "post_excerpt": postExcerpt,
    "post_status": postStatus,
    "comment_status": commentStatus,
    "ping_status": pingStatus,
    "post_password": postPassword,
    "post_name": postName,
    "to_ping": toPing,
    "pinged": pinged,
    "post_modified": postModified.toIso8601String(),
    "post_modified_gmt": postModifiedGmt.toIso8601String(),
    "post_content_filtered": postContentFiltered,
    "post_parent": postParent,
    "guid": guid,
    "menu_order": menuOrder,
    "post_type": postType,
    "post_mime_type": postMimeType,
    "comment_count": commentCount,
    "filter": filter,
    "ancestors": List<dynamic>.from(ancestors.map((x) => x)),
    "page_template": pageTemplate,
    "post_category": List<dynamic>.from(postCategory.map((x) => x)),
    "tags_input": List<dynamic>.from(tagsInput.map((x) => x)),
    "author_name": authorName,
  };
}
