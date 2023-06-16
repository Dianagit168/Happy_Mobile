import 'package:flutter/material.dart';
import 'package:ui/widgets/expense_list/expenses_list.dart';

import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpense = [
    Expense(
        title: 'Flutter Course',
        amount: 19.9900,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.5900,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Text('Flutter Expense Tracker'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.add),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 247, 249, 251),
                  Color.fromARGB(255, 119, 150, 218),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('The chart'),
                  const SizedBox(
                    height: 20,
                  ),
                  ExpenseList(
                    expenses: registeredExpense,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
