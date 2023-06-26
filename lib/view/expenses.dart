import 'package:flutter/material.dart';
import 'package:ui/chart/chart.dart';
import 'package:ui/widgets/expense_list/expenses_list.dart';
import 'package:ui/widgets/expense_list/new_expense.dart';

import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpense.indexOf(expense);
    setState(() {
      registeredExpense.remove(expense);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Expense delete'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ));
    });
  }

  final List<Expense> registeredExpense = [
    Expense(
        title: 'Flutter Course',
        amount: 19.9900,
        date: DateTime.now(),
        categories: Categories.work),
    Expense(
        title: 'Cinema',
        amount: 15.5900,
        date: DateTime.now(),
        categories: Categories.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    final widthScr = MediaQuery.of(context).size.width;
    Widget mainContain = const Center(
      child: Text('Expense not found, please add new !'),
    );
    if (registeredExpense.isNotEmpty) {
      setState(() {
        mainContain = ExpenseList(
          expenses: registeredExpense,
          onRemoveItem: (expense) {
            final expenseValue = expense;
            _removeExpense(expense);
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NewExpense(
                    onAddExpense: addExpense,
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
              child: widthScr < 600
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Chart(expenses: registeredExpense),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(child: mainContain),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: Chart(expenses: registeredExpense)),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(child: mainContain),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
