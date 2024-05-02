import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [
    Expense(
      title: "dfdfdf",
      amount: 34.33,
      category: Category.dance,
      date: DateTime.now(),
    ),
    Expense(
      title: "dfdfdf",
      amount: 34.33,
      category: Category.dance,
      date: DateTime.now(),
    ),
    Expense(
      title: "dfdfdf",
      amount: 34.33,
      category: Category.dance,
      date: DateTime.now(),
    ),
    Expense(
      title: "dfdfdf",
      amount: 34.33,
      category: Category.dance,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("app bard"),
          Text("Summry detials"),
          Text("expenses"),
        ],
      ),
    );
  }
}
