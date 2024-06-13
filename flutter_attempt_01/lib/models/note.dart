import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { Personal, Business, Work, Leisure, Favourites, Other }

const uuid = Uuid();
const categoryIcons = {
  Category.Personal: Icons.admin_panel_settings,
  Category.Business: Icons.business_center,
  Category.Leisure: Icons.movie,
  Category.Work: Icons.work,
  Category.Favourites: Icons.favorite,
  Category.Other: Icons.find_in_page,
};

final formatter = DateFormat.yMd();

class Note {
  Note({
    required this.content,
    required this.lastUpdated,
    required this.title,
    required this.category,
  }) : id = uuid.v4();
  Note.second(
      {required this.content,
      required this.lastUpdated,
      required this.title,
      required this.category,
      required this.id});
  String content;
  DateTime lastUpdated;
  String title;
  Category category;
  String id;

  String get formattedDate {
    return formatter.format(lastUpdated);
  }
}
