import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //saveNewExpense is a reference variable, meaning it holds a reference
  //(or a pointer) to an object in memory.When you initialize saveNewExpense
  // with TextEditingController(), it creates a new TextEditingController object
  // in memory, and saveNewExpense holds a reference to this object.the dispose()
  // method is called, which disposes of the TextEditingController object.
  //This means the object is removed from memory, but saveNewExpense still
  //holds its reference. When the modal is reopened, you're not changing the reference
  //Instead, you're creating a new TextEditingController object in memory, and
  //then saveNewExpense is updated to hold a reference to this new object

  final saveNewExpense = TextEditingController();

  @override
  void dispose() {
    saveNewExpense.dispose();
    super.dispose();
  }

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
