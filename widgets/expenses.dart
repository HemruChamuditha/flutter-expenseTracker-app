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

//Created a Modal --> When click the icon button - Start
  void createModal() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const Column(
            children: [
              Text("hy how are you"),
              
            ],
          );
        });
  }
//Created a Modal --> When click the icon button - End


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CoinKeeper"),
        actions: [
          IconButton(
            onPressed: createModal,
            icon: const Icon(Icons.add),
          )
        ],
      ),
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
