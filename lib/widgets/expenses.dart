
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense_state.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpandedOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpenseState());
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compenses tracker'),
        actions: [
          IconButton(onPressed: _openAddExpandedOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
           children: [
            const Text('The chart'),
            Expanded(child: ExpensesList(expenses: _registeredExpenses),)
            ],
        ),
    );
  }
  
}