import 'package:flutter/cupertino.dart';
import 'package:ui/model/expense.dart';
import 'package:ui/widgets/expense_list/expenses_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key, required this.expenses}) : super(key: key);
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ExpensesItem(
          expense: expenses[index],
        );
      },
      itemCount: expenses.length,
    );
  }
}
