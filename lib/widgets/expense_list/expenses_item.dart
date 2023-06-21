import 'package:flutter/material.dart';
import 'package:ui/model/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({Key? key, required this.expense}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('${expense.title}'),
            Row(
              children: [
                Text('\$${expense.amount!.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoriesIcon[expense.categories]),
                    const SizedBox(width: 10),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
