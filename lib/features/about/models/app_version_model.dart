import 'package:flutter/material.dart';

@immutable
class AppVersionModel {
  const AppVersionModel({
    required this.name,
    required this.icon,
    required this.date,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic> json) {
    return AppVersionModel(
      name: json['name'] as String,
      icon: json['icon'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }

  final String name;
  final String icon;
  final DateTime date;
}
