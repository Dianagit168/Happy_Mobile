import 'package:flutter/material.dart';
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

  void _removeItems(Expense expense) {
    print("setstate snackbar");
    final SnackBar snacker = SnackBar(
      content: const Text('Expense delete'),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            registeredExpense.insert;
          });
        },
      ),
    );

    setState(() {
      registeredExpense.remove(expense);
      ScaffoldMessenger.of(context).showSnackBar(snacker);
      print("setstate snackbar");
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
    Widget mainContain = const Center(
      child: Text('Expense not found, please add new !'),
    );
    if (registeredExpense.isNotEmpty) {
      setState(() {
        mainContain = ExpenseList(
          expenses: registeredExpense,
          onRemoveItem: (expense) {
            print("remove");
            final expenseValue = expense;
            print("id ${expenseValue.title}");
            _removeItems(expense);
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('The chart'),
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
