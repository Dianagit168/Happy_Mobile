import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key, required this.onAddExpense}) : super(key: key);
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final controllerTitle = TextEditingController();
  final controllerAmount = TextEditingController();

  DateTime? selectedDate;
  Categories _selectedCategories = Categories.leisure;

  void presentDatepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void showDialogf() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('In Valid Data'),
              content: const Text(
                  'Please make sure your information was entered and true'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Okay')),
              ],
            );
          });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('In Valid Data'),
            content: const Text(
                'Please make sure your information was entered and true'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Okay')),
            ],
          );
        },
      );
    }
  }

  void submitData() {
    final enteredAmount = double.tryParse(controllerAmount.text);
    final invalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (controllerTitle.text.trim().isEmpty ||
        invalidAmount ||
        selectedDate == null) {
      return showDialogf();
    }
    widget.onAddExpense(
      Expense(
          amount: enteredAmount,
          title: controllerTitle.text,
          date: selectedDate,
          categories: _selectedCategories),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllerTitle,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('Input Title')),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controllerAmount,
                decoration: const InputDecoration(
                  prefix: Text('\$ '),
                  label: Text('Input Amount'),
                ),
              ),
            ),
            Row(
              children: [
                Text(selectedDate == null
                    ? 'No selected date'
                    : formatter.format(selectedDate!)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: presentDatepicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
          ],
        ),
        Row(
          children: [
            DropdownButton<Categories>(
              value: _selectedCategories,
              items: Categories.values
                  .map(
                    (categories) => DropdownMenuItem(
                      value: categories,
                      child: Text(
                        categories.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (valued) {
                setState(() {
                  _selectedCategories = valued!;
                });
              },
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: submitData, child: const Text('Save')),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ],
    );
  }
}
