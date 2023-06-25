import 'package:flutter/material.dart';
import 'package:ui/model/expense.dart';
import 'package:ui/widgets/expense_list/expenses_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {Key? key, required this.expenses, required this.onRemoveItem})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveItem(expenses[index]);
          },
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  Theme.of(context).colorScheme.primary.withOpacity(0.0)
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
              // boxShadow: [
              //   BoxShadow(offset: Offset.infinite),
              // ],
            ),
          ),
          child: ExpensesItem(
            expense: expenses[index],
          ),
        );
      },
      itemCount: expenses.length,
    );
  }
}
