import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  /* saveNewExpense is a reference variable, meaning it holds a reference
  (or a pointer) to an object in memory.When you initialize saveNewExpense
  with TextEditingController(), it creates a new TextEditingController object
  in memory, and saveNewExpense holds a reference to this object.the dispose()
  method is called, which disposes of the TextEditingController object.
  This means the object is removed from memory, but saveNewExpense still
  holds its reference.
  
   When the modal is reopened, you're not changing the reference
  Instead, you're creating a new TextEditingController object in memory, and
  then saveNewExpense is updated to hold a reference to this new object */

  final _saveNewExpense = TextEditingController();
  final _saveNewExpenseCost = TextEditingController();

  @override
  void dispose() {
    _saveNewExpense.dispose();
    _saveNewExpenseCost.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _saveNewExpense,
            maxLength: 40,
            decoration: const InputDecoration(label: Text("Expense Title")),
          ),
          TextField(
            controller: _saveNewExpenseCost,
            maxLength: 23,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "\$ ",
              label: Text("Cost"),
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cancel_outlined,
                    color: Color.fromARGB(255, 255, 33, 33)),
                label: const Text("Cancel"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print(_saveNewExpense.text);
                  print(_saveNewExpenseCost.text);
                },
                icon: const Icon(
                  Icons.save_as_rounded,
                  color: Color.fromARGB(255, 53, 53, 243),
                ),
                label: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
