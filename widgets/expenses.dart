import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
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
      title: "travel",
      amount: 34.33,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: "food",
      amount: 34.33,
      category: Category.food,
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

    //This is a info Msg which contains a Undo option for user
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
    final width = (MediaQuery.of(context).size.width);

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
      body: width < 415
          //Height is infinity
          //Width depends on childern
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: ExpensesList(
                      expenses: _registeredExpenses,
                      onRemoveExpense: removeExpense),
                ),
              ],
            )
          //Row has a Width of infinity
          //Height is depends on its' childern
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(
                  child: ExpensesList(
                      expenses: _registeredExpenses,
                      onRemoveExpense: removeExpense),
                ),
              ],
            ),
    );
  }
}
