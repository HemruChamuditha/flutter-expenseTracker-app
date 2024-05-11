import 'package:expense_tracker/models/expense.dart';
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
  DateTime? _chosenDate;
  Category _selectedCategory = Category.travel;

//Showing calander
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now, // current date
      firstDate: firstDate, //Lowest possible date
      lastDate: now, //maximum date that can be selected
    );
    //This setState method run only if selectedDate is not null..
    setState(
      () {
        _chosenDate = selectedDate;
      },
    );
  }

// Validating and Saving Expense data

  void _saveNewExpenseData() {
    final isNewCostInvalid = double.tryParse(_saveNewExpenseCost.text) == null;
    final isChosenDateInvalid = _chosenDate == null;

    if (_saveNewExpense.text.trim().isEmpty ||
        isChosenDateInvalid ||
        isNewCostInvalid) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Input"),
            content: const Text("Please Enter valid Title, Amount and a Date"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Okay"),
              )
            ],
          );
        },
      );
      return; //full function eknm eliyata ynwa
    }
  }

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
            decoration: const InputDecoration(
              label: Text("Expense Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _saveNewExpenseCost,
                  maxLength: 23,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text("Cost"),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _chosenDate == null
                          ? "No Date"
                          : dateTimeFormatter.format(_chosenDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              //it means you have a list that can hold DropdownMenuItem objects,
              //and those objects can hold values of any type due to the dynamic
              // keyword.
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (singleCategoryItem) => DropdownMenuItem(
                          value: singleCategoryItem,
                          child: Text(
                            singleCategoryItem.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                      print(_selectedCategory);
                    });
                  }),
              const Spacer(),
              //Cancel Button Start
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Color.fromARGB(255, 255, 33, 33),
                ),
                label: const Text("Cancel"),
              ),
              //Cancel Button End

              ElevatedButton.icon(
                onPressed: _saveNewExpenseData,
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
