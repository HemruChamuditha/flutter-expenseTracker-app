import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            maxLength: 40,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text("Expense Title")),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save_as_rounded),
                label: const Text("Save Expense"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
