import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() {
    return _ExpenseTrackerState();
  }
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
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
