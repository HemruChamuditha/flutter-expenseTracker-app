import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses.list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  @override
  Widget build(context) {
    if (expenses.isEmpty) {
      return const Center(child: Text("Please Add some Expenses"));
    } else {
      return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Colors.black,
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(
            expenses[index],
          ),
        ),
      );
    }
  }
}
