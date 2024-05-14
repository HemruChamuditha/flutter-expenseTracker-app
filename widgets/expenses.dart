import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses.list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          onSavedExpense: addNewExpense,
        );
      },
    );
  }
//Created a Modal --> When click the icon button - End

  void addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final removedExpenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted!"),
        duration: const Duration(
          seconds: 3,
        ),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(
              () {
                _registeredExpenses.insert(removedExpenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

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
            child: ExpensesList(
                expenses: _registeredExpenses, onRemoveExpense: removeExpense),
          ),
        ],
      ),
    );
  }
}
