import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses.list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "dance",
      amount: 34.33,
      category: Category.dance,
      date: DateTime.now(),
    ),
    Expense(
      title: "travel",
      amount: 34.33,
      category: Category.travel,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("hyy"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
