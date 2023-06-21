import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Categories {
  food,
  travel,
  leisure,
  work;
}

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

class ExpenseColoection {
  final Categories? category;
  final List<Expense?> expenses;

  ExpenseColoection(this.category, this.expenses);
  ExpenseColoection.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.categories == category)
            .toList();

  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense!.amount!;
    }
    return sum;
  }
}
