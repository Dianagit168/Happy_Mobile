import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Categories { food, travel, leisure, work }

const categoriesIcon = {
  Categories.food: Icons.lunch_dining,
  Categories.travel: Icons.flight_takeoff,
  Categories.leisure: Icons.movie,
  Categories.work: Icons.work,
};

class Expense {
  final String? id;
  final String? title;
  final double? amount;
  final DateTime? date;
  final Categories? categories;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.categories})
      : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date!);
  }
}
