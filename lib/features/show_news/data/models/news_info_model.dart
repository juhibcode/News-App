import 'package:news_app/features/show_news/domain/entities/new_info.dart';
import 'package:flutter/material.dart';

class NewsInfoModel extends NewsInfo {
  NewsInfoModel({
    String? title,
    String? author,
    String? imageURL,
    String? content,
    String? dateTime,
  }) : super(
    title: title,
    author: author,
    imageURL: imageURL,
    content: content,
    dateTime: _getDateTimeInDataTime(dateTime),
  );

  static DateTime _getDateTimeInDataTime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    }
    else {
      final DateTime? dateTimeInDataTimeFormat = DateTime.tryParse(dateTime);
      if (dateTimeInDataTimeFormat == null) {
        return DateTime.now();
      } else {
        return dateTimeInDataTimeFormat;
      }
    }
  }
  factory NewsInfoModel.fromMap(Map<String,dynamic>map){
    return NewsInfoModel(
      title: map['title'],
      author: map['author'],
      imageURL: map['urlToImage'],
      content: map['content'],
      dateTime: map['publishedAT'],
    );
  }
}
