// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TagModel {
  final String title;
  final bool isSelected;
  TagModel({
    required this.title,
    required this.isSelected,
  });

  TagModel copyWith({
    String? title,
    bool? isSelected,
  }) {
    return TagModel(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isSelected': isSelected,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      title: map['title'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TagModel(title: $title, isSelected: $isSelected)';

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.isSelected == isSelected;
  }

  @override
  int get hashCode => title.hashCode ^ isSelected.hashCode;
}
