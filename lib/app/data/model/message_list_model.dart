// To parse this JSON data, do
//
//     final messageListModel = messageListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MessageListModel messageListModelFromJson(String str) =>
    MessageListModel.fromJson(json.decode(str));

String messageListModelToJson(MessageListModel data) =>
    json.encode(data.toJson());

class MessageListModel {
  final int count;
  final String pageToken;
  final List<Message> messages;

  MessageListModel({
    required this.count,
    required this.pageToken,
    required this.messages,
  });

  factory MessageListModel.fromJson(Map<String, dynamic> json) =>
      MessageListModel(
        count: json["count"],
        pageToken: json["pageToken"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pageToken": pageToken,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  final String content;
  final String updated;
  final int id;
  final Author author;
  bool isFavourite;

  Message(
      {required this.content,
      required this.updated,
      required this.id,
      required this.author,
      this.isFavourite = false});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        content: json["content"],
        updated: json["updated"],
        id: json["id"],
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "updated": updated,
        "id": id,
        "author": author.toJson(),
      };
}

class Author {
  final String name;
  final String photoUrl;

  Author({
    required this.name,
    required this.photoUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photoUrl": photoUrl,
      };
}
