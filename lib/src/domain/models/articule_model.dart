import 'dart:convert';

import 'package:flutter/foundation.dart';

class ArticuleModel {
  final String title;
  final String description;
  final String timeToRead;
  final List<String> tags;
  final String path;
  final String priority;
  bool favorite;
  final DateTime addedAt;
  final String urlArticule;
  final String urlFavicon;
  final int? progress;
  final String folderPath;

  ArticuleModel({
    required this.title,
    required this.description,
    required this.timeToRead,
    required this.tags,
    required this.path,
    required this.priority,
    required this.favorite,
    required this.addedAt,
    required this.urlArticule,
    required this.urlFavicon,
    this.progress,
    required this.folderPath,
  });

  ArticuleModel copyWith({
    String? title,
    String? description,
    String? timeToRead,
    List<String>? tags,
    String? path,
    String? priority,
    bool? favorite,
    DateTime? addedAt,
    String? urlArticule,
    String? urlFavicon,
    int? progress,
    String? folderPath,
  }) {
    return ArticuleModel(
      title: title ?? this.title,
      description: description ?? this.description,
      timeToRead: timeToRead ?? this.timeToRead,
      tags: tags ?? this.tags,
      path: path ?? this.path,
      priority: priority ?? this.priority,
      favorite: favorite ?? this.favorite,
      addedAt: addedAt ?? this.addedAt,
      urlArticule: urlArticule ?? this.urlArticule,
      urlFavicon: urlFavicon ?? this.urlFavicon,
      progress: progress ?? this.progress,
      folderPath: folderPath ?? this.folderPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'timeToRead': timeToRead,
      'tags': tags,
      'path': path,
      'priority': priority,
      'favorite': favorite,
      'addedAt': addedAt.millisecondsSinceEpoch,
      'urlArticule': urlArticule,
      'urlFavicon': urlFavicon,
      'progress': progress,
      'folderPath': folderPath,
    };
  }

  factory ArticuleModel.fromMap(Map<String, dynamic> map) {
    return ArticuleModel(
      title: map['title'] as String,
      description: map['description'] as String,
      timeToRead: map['timeToRead'] as String,
      tags: List<String>.from((map['tags'] as List<String>)),
      path: map['path'] as String,
      priority: map['priority'] as String,
      favorite: map['favorite'] as bool,
      addedAt: DateTime.fromMillisecondsSinceEpoch(map['addedAt'] as int),
      urlArticule: map['urlArticule'] as String,
      urlFavicon: map['urlFavicon'] as String,
      progress: map['progress'] != null ? map['progress'] as int : 0,
      folderPath: map['folderPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticuleModel.fromJson(String source) =>
      ArticuleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticuleModel(title: $title, description: $description, timeToRead: $timeToRead, tags: $tags, path: $path, priority: $priority, favorite: $favorite, addedAt: $addedAt, urlArticule: $urlArticule, urlFavicon: $urlFavicon, progress: $progress, folderPath: $folderPath)';
  }

  @override
  bool operator ==(covariant ArticuleModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.timeToRead == timeToRead &&
        listEquals(other.tags, tags) &&
        other.path == path &&
        other.priority == priority &&
        other.favorite == favorite &&
        other.addedAt == addedAt &&
        other.urlArticule == urlArticule &&
        other.urlFavicon == urlFavicon &&
        other.progress == progress &&
        other.folderPath == folderPath;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        timeToRead.hashCode ^
        tags.hashCode ^
        path.hashCode ^
        priority.hashCode ^
        favorite.hashCode ^
        addedAt.hashCode ^
        urlArticule.hashCode ^
        urlFavicon.hashCode ^
        progress.hashCode ^
        folderPath.hashCode;
  }
}
